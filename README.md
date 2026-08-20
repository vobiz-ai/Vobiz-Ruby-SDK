# Vobiz Ruby Library

Ruby client for the Vobiz programmable voice and SIP-trunking API, with a
`Vobiz::XML` builder for call-control documents.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Ruby](https://img.shields.io/badge/ruby-%3E%3D%203.3-CC342D.svg)](https://www.ruby-lang.org/)
[![Docs](https://img.shields.io/badge/docs-docs.vobiz.ai-3b82f6.svg)](https://docs.vobiz.ai)
[![fern shield](https://img.shields.io/badge/%F0%9F%8C%BF-Built%20with%20Fern-brightgreen)](https://buildwithfern.com?utm_source=github&utm_medium=github&utm_campaign=readme&utm_source=Vobiz%2FRuby)

## Overview

The Vobiz Ruby library is the official client for the Vobiz REST API. It covers the
whole platform surface: placing and controlling calls, live-call inspection, in-call
actions such as text-to-speech, audio playback and DTMF, recordings, call detail
records, phone-number inventory, SIP trunks and endpoints, conferences,
applications, sub-accounts and KYC, IP access control lists, balance and the partner
API.

The client is generated from the Vobiz OpenAPI specification with
[Fern](https://buildwithfern.com), so every resource client, method and typed model
tracks the published API. Responses are parsed into typed model objects rather than
raw hashes, and the request models validate required fields before a request leaves
your process.

The gem has **no runtime dependencies** — it uses `net/http` and `json` from the
standard library, with automatic retries and exponential backoff built into the
internal HTTP client. That keeps it easy to vendor into a Rails app or a Sidekiq
worker without pulling in a transitive dependency tree.

Alongside the API client the gem ships `Vobiz::XML`, a self-contained builder for
VobizXML — the XML call-control documents Vobiz fetches from your `answer_url` when a
call connects. It mirrors the `plivoxml` builder shape and emits XML byte-identical
to the Python, Node and Go builders.

At the end of a first integration you should be able to place an outbound call from
Ruby, serve a VobizXML document that speaks a prompt and collects a DTMF digit, watch
the call in the live-calls list, and read the resulting CDR.

## Installation

The gem is not yet on RubyGems. Point Bundler at the repository:

```ruby
# Gemfile
gem "vobiz", git: "https://github.com/vobiz-ai/Vobiz-Ruby-SDK.git"
```

Pin a commit for reproducible builds:

```ruby
gem "vobiz", git: "https://github.com/vobiz-ai/Vobiz-Ruby-SDK.git", ref: "<commit-sha>"
```

Or clone and work against it directly:

```sh
git clone https://github.com/vobiz-ai/Vobiz-Ruby-SDK.git
cd Vobiz-Ruby-SDK
bundle install
bundle exec rake test
```

Requires Ruby 3.3.0 or newer — the generated code uses pattern matching and shorthand
hash syntax. Once the gem is published, `gem install vobiz` will be the recommended
route; see [Roadmap](#roadmap).

## Authentication

Vobiz identifies your account with an **Auth ID** and an **Auth Token**, and
authorises the request with a **bearer token**.

The client constructor takes the bearer token:

```ruby
require "vobiz"

client = Vobiz::Client.new(token: ENV.fetch("VOBIZ_TOKEN"))
```

`Vobiz::Client#initialize` accepts exactly three keyword arguments — `token:`,
`base_url:` and `max_retries:` — and sets `Authorization: Bearer <token>` on every
request.

Supply the `X-Auth-ID` and `X-Auth-Token` headers through the per-request
`additional_headers` option:

```ruby
AUTH_HEADERS = {
  "X-Auth-ID" => ENV.fetch("VOBIZ_AUTH_ID"),
  "X-Auth-Token" => ENV.fetch("VOBIZ_AUTH_TOKEN")
}.freeze

client.live_calls.list_live_calls(
  auth_id: ENV.fetch("VOBIZ_AUTH_ID"),
  status: Vobiz::LiveCalls::Types::ListLiveCallsRequestStatus::LIVE,
  request_options: { additional_headers: AUTH_HEADERS }
)
```

Wrapping that in a small helper keeps call sites tidy:

```ruby
module VobizClient
  AUTH_ID = ENV.fetch("VOBIZ_AUTH_ID")

  def self.client
    @client ||= Vobiz::Client.new(token: ENV.fetch("VOBIZ_TOKEN"))
  end

  def self.request_options
    {
      additional_headers: {
        "X-Auth-ID" => AUTH_ID,
        "X-Auth-Token" => ENV.fetch("VOBIZ_AUTH_TOKEN")
      }
    }
  end
end
```

Note the separate `auth_id:` parameter on the request methods. That is the account
the operation acts on, and it goes into the URL path. It is usually the same value as
the `X-Auth-ID` header.

Keep credentials in environment variables or a secrets manager, never in source. Sign
up and find your credentials at [vobiz.ai](https://vobiz.ai); the credential model is
documented at [docs.vobiz.ai/api-reference](https://docs.vobiz.ai/api-reference).

## Quickstart

Place an outbound call. Vobiz dials `to`, and when the callee answers it fetches your
`answer_url` for a VobizXML document describing what should happen next.

```ruby
require "vobiz"

client = Vobiz::Client.new(token: ENV.fetch("VOBIZ_TOKEN"))

AUTH_ID = ENV.fetch("VOBIZ_AUTH_ID")
REQUEST_OPTIONS = {
  additional_headers: {
    "X-Auth-ID" => AUTH_ID,
    "X-Auth-Token" => ENV.fetch("VOBIZ_AUTH_TOKEN")
  }
}.freeze

response = client.calls.make_call(
  auth_id: AUTH_ID,
  from: "14155551234",
  to: "+15550003333",
  answer_url: "https://example.com/answer",
  answer_method: "POST",
  request_options: REQUEST_OPTIONS
)

puts response.inspect
```

Notes on the calling convention, which is uniform across the whole gem:

- **Every method takes keyword arguments in snake_case**, matching the wire format —
  `auth_id:`, `call_uuid:`, `answer_url:`, `per_page:`.
- **`request_options:` is a separate keyword** holding transport-level settings, kept
  out of the request body.
- **Required fields are validated client-side** by the generated request models, so a
  missing `answer_url:` raises before the HTTP call is made.
- `to` accepts multiple destinations separated by `<`, fanning a single request out to
  up to 1000 destinations, for example `"+15550003333<+15550004444"`.

## Common operations

Every snippet below reuses `client`, `AUTH_ID` and `REQUEST_OPTIONS` from the
quickstart, and omits `request_options: REQUEST_OPTIONS` for brevity — add it to each
call. Signatures come from the generated resource clients under
[`lib/vobiz/`](./lib/vobiz); the exhaustive list is in
[`reference.md`](./reference.md).

### List live calls

`status:` is required. The generated enum modules hold the valid values.

```ruby
live = client.live_calls.list_live_calls(
  auth_id: AUTH_ID,
  status: Vobiz::LiveCalls::Types::ListLiveCallsRequestStatus::LIVE   # or ::QUEUED
)

detail = client.live_calls.get_live_call(
  auth_id: AUTH_ID,
  call_uuid: "cdr_XXXXXXXXXX",
  status: Vobiz::LiveCalls::Types::GetLiveCallRequestStatus::LIVE
)
```

`list_queued_calls` and `get_queued_call` mirror these for the queued set.

### Hang up a call

```ruby
client.live_calls.hangup_call(auth_id: AUTH_ID, call_uuid: "cdr_XXXXXXXXXX")
```

### Speak text and play audio into a live call

```ruby
client.speak_text.call(
  auth_id: AUTH_ID,
  call_uuid: "cdr_XXXXXXXXXX",
  text: "Your driver is two minutes away.",
  legs: Vobiz::SpeakText::Types::SpeakTextCallRequestLegs::ALEG,
  voice: "female",
  language: "en-US"
)

client.play_audio.call(
  auth_id: AUTH_ID,
  call_uuid: "cdr_XXXXXXXXXX",
  urls: "https://cdn.example.com/hold-music.mp3",
  loop: true
)

client.speak_text.stop_speak_call(auth_id: AUTH_ID, call_uuid: "cdr_XXXXXXXXXX")
client.play_audio.stop_audio_call(auth_id: AUTH_ID, call_uuid: "cdr_XXXXXXXXXX")
```

### Send DTMF

```ruby
client.dtmf.send_dtmf(
  auth_id: AUTH_ID,
  call_uuid: "cdr_XXXXXXXXXX",
  digits: "1234#",
  leg: Vobiz::Dtmf::Types::SendDtmfRequestLeg::ALEG   # ALEG | BLEG | BOTH
)
```

### Record a call and fetch the recording

```ruby
client.record_calls.start_recording(
  auth_id: AUTH_ID,
  call_uuid: "cdr_XXXXXXXXXX",
  file_format: Vobiz::RecordCalls::Types::StartRecordingRequestFileFormat::MP3,
  record_channel_type: Vobiz::RecordCalls::Types::StartRecordingRequestRecordChannelType::STEREO,
  time_limit: 600,
  transcription_type: "auto",
  callback_url: "https://example.com/recording-ready"
)

client.record_calls.stop_recording(auth_id: AUTH_ID, call_uuid: "cdr_XXXXXXXXXX")

recordings = client.recordings.list_recordings(auth_id: AUTH_ID, limit: 20, offset: 0)
client.recordings.get_recording(auth_id: AUTH_ID, recording_id: "REC_ID")
client.recordings.delete_recording(auth_id: AUTH_ID, recording_id: "REC_ID")
```

### Query call detail records

`start_date:` and `end_date:` are `YYYY-MM-DD` strings, and each is required when the
other is set.

```ruby
page = client.cdr.list_cdrs(
  auth_id: AUTH_ID,
  start_date: "2026-01-01",
  end_date: "2026-01-31",
  call_direction: Vobiz::Cdr::Types::ListCdrsRequestCallDirection::OUTBOUND,
  min_duration: 30,
  page: 1,
  per_page: 100   # max 100
)

recent = client.cdr.list_recent_cdrs(auth_id: AUTH_ID, limit: 25)
one = client.cdr.get_cdr(auth_id: AUTH_ID, call_id: "CALL_ID")
```

`search_cdrs` takes the same filters as `list_cdrs`, and `export_cdrs` takes the same
filters without the paging arguments. Other filters on all three: `from_number:`,
`to_number:`, `sip_call_id:`, `bridge_uuid:`, `hangup_cause:`, `hangup_disposition:`,
`context:`, `campaign_id:` and free-text `search:`.

### Other resource groups

The same pattern — `client.<group>.<method>(auth_id: ..., ...)` — covers `account`,
`balance`, `phone_numbers`, `applications`, `trunks`, `endpoints`, `credentials`,
`conference`, `conferences`, `conference_members`, `conference_recording`,
`audio_streams`, `sub_accounts`, `sub_account_kyc`, `sub_account_kyc_test_mode`,
`bulk_operations`, `ip_access_control_list`, `origination_uri` and `partner_api`. See
[`reference.md`](./reference.md) for every signature.

## VobizXML

`Vobiz::XML` builds the call-control documents Vobiz fetches from your `answer_url`.
It is a single self-contained file with no dependency on the rest of the SDK, so you
can `require "vobiz/xml"` in a Rack or Rails controller without constructing an API
client.

```ruby
require "vobiz/xml"

response = Vobiz::XML::Response.new

gather = response.add_gather(
  action: "https://example.com/menu",
  method: "POST",
  input_type: "dtmf",
  num_digits: 1,
  execution_timeout: 10
)
gather.add_speak("Press 1 for sales, or 2 for support.")

response.add_speak("We did not receive any input. Goodbye.")
response.add_hangup

puts response.to_s
```

That prints:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Response>
    <Gather action="https://example.com/menu" method="POST" inputType="dtmf" numDigits="1" executionTimeout="10">
        <Speak>Press 1 for sales, or 2 for support.</Speak>
    </Gather>
    <Speak>We did not receive any input. Goodbye.</Speak>
    <Hangup/>
</Response>
```

Points worth knowing:

- **snake_case in, camelCase out.** Keyword arguments are converted by
  `Vobiz::XML::Helpers.to_camel`, so `input_type:` becomes `inputType` and
  `execution_timeout:` becomes `executionTimeout`. `<Gather>` uses
  `executionTimeout`, never `timeout`. Keys already in camelCase pass through
  unchanged.
- **A trailing underscore is stripped**, so a reserved word can be passed as `foo_`.
- **Booleans render as `true`/`false`**, and text plus attribute values are XML
  escaped for you.
- **`add_*` helpers return the child element**, so you can keep nesting:
  `response.add_dial.add_number("+15550003333")`.
- **`ssml:` injects raw, unescaped content** into `<Speak>` when you need SSML markup.
- **`to_s(pretty: false)` emits the document on a single line**, which is usually what
  you want in a webhook response.

Builder classes: `Response`, `Speak`, `Play`, `Wait`, `Gather`, `Dial`, `Number`,
`User`, `Record`, `Conference`, `DTMF`, `Redirect`, `Hangup`, `PreAnswer` and
`Stream`.

Serving it from Rails:

```ruby
class VobizController < ApplicationController
  skip_before_action :verify_authenticity_token

  def answer
    r = Vobiz::XML::Response.new
    r.add_speak("Thanks for calling. Connecting you now.")
    r.add_dial.add_number("+15550003333")

    render xml: r.to_s(pretty: false)
  end
end
```

## Configuration

### Environments and base URL

The client targets production by default. Pass `base_url:` to override it — useful for
a proxy, a gateway, or a local mock:

```ruby
client = Vobiz::Client.new(
  token: ENV.fetch("VOBIZ_TOKEN"),
  base_url: Vobiz::Environment::PRODUCTION   # https://api.vobiz.ai
)

local = Vobiz::Client.new(
  token: ENV.fetch("VOBIZ_TOKEN"),
  base_url: "http://localhost:8080"
)
```

### Client options

| Option | Type | Default | Description |
| --- | --- | --- | --- |
| `token:` | `String` | required | Sent as `Authorization: Bearer …` |
| `base_url:` | `String` | `Vobiz::Environment::PRODUCTION` | API base URL |
| `max_retries:` | `Integer` | `2` | Retry attempts for retryable statuses |

### Per-request options

Every method takes a `request_options:` hash:

| Key | Description |
| --- | --- |
| `:base_url` | Override the base URL for this request only |
| `:additional_headers` | Extra headers, for example `X-Auth-ID` and `X-Auth-Token` |
| `:additional_query_parameters` | Extra query string parameters |

```ruby
client.cdr.list_cdrs(
  auth_id: AUTH_ID,
  per_page: 100,
  request_options: {
    additional_headers: { "X-Auth-ID" => AUTH_ID, "X-Custom-Header" => "value" },
    additional_query_parameters: { "trace" => "1" }
  }
)
```

Headers the SDK sets itself — `Authorization`, `Content-Type`, `Accept` and the
`X-Fern-*` metadata — are protected, so `additional_headers` cannot override them.

### Retries

Requests are retried with exponential backoff plus jitter on **408**, **429**, **500**,
**502**, **503**, **504**, **521**, **522** and **524**, twice by default. If a
`Retry-After` header is present the SDK honours it. The backoff starts at 0.5 seconds
and is capped at 60 seconds.

```ruby
client = Vobiz::Client.new(token: ENV.fetch("VOBIZ_TOKEN"), max_retries: 3)
```

Set `max_retries: 0` to disable retries — worth doing for non-idempotent operations
where a duplicate would be worse than a failure.

### Timeouts

The underlying HTTP client applies a 60 second timeout to connect, read, write and
continue. Wrap a call in `Timeout.timeout` if you need a tighter deadline for a
specific operation; a per-request timeout option is on the [Roadmap](#roadmap).

## Error handling

Failed API calls raise error classes you can rescue granularly. All of them descend
from `Vobiz::Errors::ApiError`.

```ruby
require "vobiz"

begin
  result = client.calls.make_call(
    auth_id: AUTH_ID,
    from: "14155551234",
    to: "+15550003333",
    answer_url: "https://example.com/answer",
    answer_method: "POST"
  )
rescue Vobiz::Errors::TimeoutError
  puts "API didn't respond before our timeout elapsed"
rescue Vobiz::Errors::UnauthorizedError
  puts "Check the bearer token and the X-Auth-ID / X-Auth-Token headers"
rescue Vobiz::Errors::NotFoundError
  puts "The call, recording or account does not exist"
rescue Vobiz::Errors::ServiceUnavailableError
  puts "API returned status 503, is probably overloaded, try again later"
rescue Vobiz::Errors::ServerError
  puts "API returned some other 5xx status, this is probably a bug"
rescue Vobiz::Errors::ResponseError => e
  puts "API returned an unexpected status: #{e.code} #{e.message}"
rescue Vobiz::Errors::ApiError => e
  puts "Some other error occurred when calling the API: #{e.message}"
end
```

The hierarchy, and how status codes map onto it:

| Class | Status | Parent |
| --- | --- | --- |
| `Vobiz::Errors::ApiError` | — | `StandardError` |
| `Vobiz::Errors::TimeoutError` | — | `ApiError` |
| `Vobiz::Errors::ResponseError` | any non-2xx | `ApiError` |
| `Vobiz::Errors::RedirectError` | 3xx | `ResponseError` |
| `Vobiz::Errors::ClientError` | 4xx | `ResponseError` |
| `Vobiz::Errors::UnauthorizedError` | 401 | `ClientError` |
| `Vobiz::Errors::ForbiddenError` | 403 | `ClientError` |
| `Vobiz::Errors::NotFoundError` | 404 | `ClientError` |
| `Vobiz::Errors::ServiceUnavailableError` | 503 | `ApiError` |
| `Vobiz::Errors::ServerError` | other 5xx | `ResponseError` |

`ResponseError` exposes `#code` (the HTTP status) and carries the raw response body as
its message, so `e.inspect` gives you both at once.

Rescue order matters: put the narrow classes first, because `ApiError` catches
everything. Note that `ServiceUnavailableError` descends from `ApiError` directly
rather than from `ServerError`, so rescue it before the generic `ApiError` clause.

Request models validate before the HTTP call, so a missing required field raises
`Vobiz::Internal::Errors::TypeError` or `ConstraintError` rather than producing a 400.

## Pagination

Listing methods paginate explicitly; you drive the loop yourself. Two conventions are
in use:

- **`page:` / `per_page:`** — `cdr.list_cdrs`, `cdr.search_cdrs` (`per_page` max 100)
- **`limit:` / `offset:`** — `recordings.list_recordings`; `cdr.list_recent_cdrs`
  takes `limit:` only

```ruby
page = 1
loop do
  result = client.cdr.list_cdrs(auth_id: AUTH_ID, page: page, per_page: 100)
  rows = result.data || []
  break if rows.empty?

  rows.each { |row| handle(row) }
  page += 1
end
```

## Troubleshooting

| Symptom | Likely cause | Fix |
| --- | --- | --- |
| `ArgumentError: unknown keyword: :auth_id` from `Vobiz::Client.new` | The constructor takes only `token:`, `base_url:` and `max_retries:` | Pass `token:` to the constructor and send `X-Auth-ID` / `X-Auth-Token` via `request_options: { additional_headers: ... }` |
| `401` on every request | The bearer token is wrong, or the `X-Auth-ID` / `X-Auth-Token` headers are absent | Check the token; confirm `additional_headers` is present on the call, not just on the client |
| `NoMethodError` or `uninitialized constant Vobiz::XML` | `vobiz/xml` is a separate file | Add `require "vobiz/xml"` alongside `require "vobiz"` |
| `syntax error, unexpected 'in'` when loading the gem | Running on Ruby 2.x; the generated code uses pattern matching and shorthand hash syntax | Upgrade to Ruby 3.3.0 or newer, as required by the gemspec |
| A custom header never arrives | `Authorization`, `Content-Type`, `Accept` and the `X-Fern-*` headers are protected from override | Use a different header name; protected keys are filtered out of `additional_headers` |
| `Vobiz::Errors::NotFoundError` from `get_live_call` or `hangup_call` | The call has already ended, so it is no longer in the live-call set | Treat 404 as "already finished"; look it up with `client.cdr.get_cdr(...)` instead |
| `Vobiz::Errors::ResponseError` with code 429 during a bulk loop | Requests are issued faster than the account's rate allowance | Raise `max_retries:`, add your own sleep between iterations, or reduce concurrency |
| A long CDR export dies at 60 seconds | The HTTP client applies a fixed 60 second timeout | Narrow the date range, or use `export_cdrs` and poll for the result |
| `Vobiz::Internal::Errors::TypeError` before any HTTP call | A required field is missing, or an enum was passed an unrecognised string | Check the request model in `lib/vobiz/<group>/types/`; use the enum constants |
| `<Gather>` never fires the `action` callback | `timeout:` was used instead of `execution_timeout:` | Pass `execution_timeout:` to `add_gather`; the builder emits `executionTimeout` |
| VobizXML renders as escaped text in the browser | The response was served as `text/html` | Render with `render xml:` or set `Content-Type: application/xml` |

## Other Vobiz SDKs

| Language | Repository | Package name |
| --- | --- | --- |
| Python | [Vobiz-Python-SDK](https://github.com/vobiz-ai/Vobiz-Python-SDK) | `vobiz` |
| Node.js / TypeScript | [Vobiz-Node-SDK](https://github.com/vobiz-ai/Vobiz-Node-SDK) | `@vobiz/sdk` |
| Go | [Vobiz-Go-SDK](https://github.com/vobiz-ai/Vobiz-Go-SDK) | `github.com/vobiz-ai/Vobiz-Go-SDK` |
| C# / .NET | [Vobiz-Csharp-sdk](https://github.com/vobiz-ai/Vobiz-Csharp-sdk) | `Vobiz` |

All of them are generated from the same OpenAPI specification, so resource groups and
method names line up across languages once you allow for naming conventions.

## Versioning and stability

`Vobiz::VERSION` is `0.0.0`, and there are no published releases yet. Pin an exact
commit in your `Gemfile` and review the diff before upgrading.

The API surface is regenerated from the Vobiz OpenAPI specification, so resource
client and method names can change when the specification changes. `Vobiz::XML` is
hand-written and follows the `plivoxml` shape; it is the more stable half of the gem.

## Roadmap

> Planned improvements to this library. Ideas and pull requests are welcome —
> open an issue to discuss anything here.

- [ ] Publish the `vobiz` gem to RubyGems with a real semantic version, so
      `gem "vobiz"` resolves from the registry rather than from git.
- [ ] Adopt semantic versioning guarantees from `1.0.0` onward, with a documented
      deprecation window for generated method renames.
- [ ] First-class `auth_id:` and `auth_token:` client options, so the account headers
      are configured once at construction instead of per request.
- [ ] Wire the documented `:timeout_in_seconds` request option through to the HTTP
      client, so a long CDR export can raise its own deadline.
- [ ] Auto-paging enumerators for `cdr.list_cdrs` and `recordings.list_recordings`,
      building on the iterator classes already present under `lib/vobiz/internal`.
- [ ] Surface the Vobiz error code and message as attributes on `ResponseError`
      rather than leaving the raw body as the message.
- [ ] Webhook signature verification helpers, so `answer_url` and callback handlers
      can validate that a request genuinely came from Vobiz.
- [ ] Extend the test suite to cover the `Vobiz::XML` builder alongside the generated
      request and response tests.

## Contributing

While we value open-source contributions to this SDK, this library is generated
programmatically. Additions made directly to this library would have to be moved over
to our generation code, otherwise they would be overwritten upon the next generated
release. Feel free to open a PR as a proof of concept, but know that we will not be
able to merge it as-is. We suggest opening an issue first to discuss with us!

On the other hand, contributions to the README and to the hand-written
[`lib/vobiz/xml.rb`](./lib/vobiz/xml.rb) builder are always very welcome. See
[CONTRIBUTING.md](./CONTRIBUTING.md) for details.

To check your changes locally:

```sh
bundle install
bundle exec rake test     # minitest
bundle exec rake lint     # rubocop
```

## License

Released under the [MIT License](./LICENSE) © Vobiz.

MIT is permissive: you may use, modify, and redistribute this code, including in
closed-source commercial products, provided the copyright notice and licence text
are retained. There is no warranty. If your organisation needs a different
licensing arrangement, contact [piyush@vobiz.ai](mailto:piyush@vobiz.ai).

## Built by Team Vobiz

[Vobiz](https://vobiz.ai) is a programmable voice and SIP-trunking platform for
voice APIs, SIP trunking, and AI voice agents. This repository is built and
maintained by the Vobiz team.

**Maintainer:** Piyush Sahoo — [piyush@vobiz.ai](mailto:piyush@vobiz.ai) · [LinkedIn](https://www.linkedin.com/in/piyush-s713/)

Questions, or want to talk through an integration? Open an issue on this repo,
or reach out directly at [piyush@vobiz.ai](mailto:piyush@vobiz.ai).

**Useful links:** [Docs](https://docs.vobiz.ai) · [API reference](https://docs.vobiz.ai/api-reference) · [Sign up](https://vobiz.ai)
