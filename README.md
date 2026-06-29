# Vobiz Ruby SDK

The official Ruby SDK for [Vobiz](https://vobiz.ai) — an AI-first voice and telephony API platform for builders. Make and control calls, manage SIP trunks, phone numbers, conferences, and recordings directly from Ruby.

- 📚 **Docs:** https://docs.vobiz.ai
- 🔑 **Dashboard & credentials:** https://console.vobiz.ai
- 🧾 **Full API reference:** [`reference.md`](./reference.md)
- ⚡ **Usage cheat-sheet:** [`USAGE.md`](./USAGE.md)

## Installation

Install the gem directly:

```sh
gem install vobiz
```

Or add it to your `Gemfile`:

```ruby
gem "vobiz"
```

Requires Ruby >= 3.3.0.

## Authentication

Authenticate with your account **Auth ID** and **Auth Token** from the
[dashboard](https://console.vobiz.ai). They map to the `X-Auth-ID` and
`X-Auth-Token` request headers.

```ruby
require "vobiz"

client = Vobiz::Client.new(
  api_key: "YOUR_AUTH_ID",       # X-Auth-ID
  auth_token: "YOUR_AUTH_TOKEN"  # X-Auth-Token
)
```

## Quickstart — make a call

```ruby
require "vobiz"

client = Vobiz::Client.new(api_key: "YOUR_AUTH_ID", auth_token: "YOUR_AUTH_TOKEN")

client.calls.make_call(
  auth_id: "YOUR_AUTH_ID",
  from: "14155551234",
  to: "+919876543210",
  answer_url: "https://example.com/answer", # returns VobizXML
  answer_method: "POST"
)
```

When the callee answers, Vobiz fetches `answer_url`, which should return
[VobizXML](https://docs.vobiz.ai/xml-builder) describing the call flow.

## What you can do

| Area | Client method |
|------|---------------|
| Calls & live calls | `client.calls`, `client.live_calls` |
| In-call actions | `client.play_audio`, `client.speak_text`, `client.dtmf`, `client.record_calls` |
| Call detail records | `client.cdr` |
| Recordings | `client.recordings` |
| Phone numbers | `client.phone_numbers` |
| Trunks / endpoints / credentials | `client.trunks`, `client.endpoints`, `client.credentials` |
| Conferences | `client.conference`, `client.conferences`, `client.conference_members` |
| Applications | `client.applications` |
| Sub-accounts & KYC | `client.sub_accounts`, `client.sub_account_kyc` |
| Account & balance | `client.account`, `client.balance` |

See [`USAGE.md`](./USAGE.md) for more examples.

## Error handling

The SDK has automatic retries with exponential backoff built in. Tune the
retry behaviour per client with `max_retries:`:

```ruby
client = Vobiz::Client.new(
  api_key: "YOUR_AUTH_ID",
  auth_token: "YOUR_AUTH_TOKEN",
  max_retries: 3
)
```

Exact request fields and response types per method are documented in
[`reference.md`](./reference.md) and at https://docs.vobiz.ai.

## Other SDKs

Vobiz ships official SDKs across languages, all under
[github.com/vobiz-ai](https://github.com/vobiz-ai):

| Language | Repository |
|----------|------------|
| TypeScript / Node | [Vobiz-Node-SDK](https://github.com/vobiz-ai/Vobiz-Node-SDK) |
| Python | [Vobiz-Python-SDK](https://github.com/vobiz-ai/Vobiz-Python-SDK) |
| Go | [Vobiz-Go-SDK](https://github.com/vobiz-ai/Vobiz-Go-SDK) |
| Java | [Vobiz-Java-SDK](https://github.com/vobiz-ai/Vobiz-Java-SDK) |
| C# | [Vobiz-Csharp-sdk](https://github.com/vobiz-ai/Vobiz-Csharp-sdk) |
| PHP | [Vobiz-PHP-SDK](https://github.com/vobiz-ai/Vobiz-PHP-SDK) |

## License

MIT
