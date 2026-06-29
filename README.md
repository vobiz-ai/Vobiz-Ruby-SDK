# Vobiz Ruby SDK

The official Ruby SDK for [Vobiz](https://vobiz.ai) — an AI-first voice and telephony API platform for builders. Make and control calls, manage SIP trunks, phone numbers, conferences, and recordings directly from your Ruby applications.

This SDK provides a comprehensive, type-safe, and idiomatic Ruby interface to the Vobiz API, enabling you to integrate powerful voice capabilities into your systems with ease.

## Quick Links

- 📚 **Vobiz API Documentation:** [docs.vobiz.ai](https://docs.vobiz.ai)
- 🔑 **Vobiz Dashboard & Credentials:** [console.vobiz.ai](https://console.vobiz.ai)
- 🧾 **Full API Reference:** [`reference.md`](./reference.md)
- ⚡ **Usage Cheat-sheet:** [`USAGE.md`](./USAGE.md)

---

## Features

The Vobiz Ruby SDK provides access to the full suite of Vobiz API capabilities, including:

- **Programmatic Call Control:** Initiate outbound calls, manage live call legs, and hang up calls.
- **In-Call Actions:** Play audio files, convert text-to-speech, send DTMF tones, and control call recordings.
- **Call Detail Records (CDRs):** Retrieve and search historical call records with extensive filtering options.
- **Recordings Management:** List, retrieve, and delete call recordings.
- **Phone Number Management:** List available numbers, purchase from inventory, rent, unrent, and assign numbers to trunks or sub-accounts.
- **SIP Trunking & Endpoints:** Create and manage SIP trunks, credentials, IP ACLs, Origination URIs, and SIP endpoints.
- **Conferences:** Create and manage conference rooms, including muting/unmuting, deafening, and kicking members.
- **Applications:** Create and manage call flow applications using VobizXML webhooks.
- **Sub-Accounts & KYC:** Programmatically manage sub-accounts and their Know Your Customer (KYC) verification processes.
- **Audio Streaming:** Start and stop real-time audio streams from live calls to WebSocket URLs.

---

## Requirements

The Vobiz Ruby SDK requires:

- Ruby **>= 3.3.0**

---

## Installation

You can install the Vobiz Ruby SDK directly as a gem:

```sh
gem install vobiz
```

Alternatively, if you're using Bundler, add it to your `Gemfile`:

```ruby
gem "vobiz"
```

Then run `bundle install`.

---

## Authentication

To authenticate your requests with the Vobiz API, you need your **Auth ID** and **Auth Token**. These credentials can be found on your [Vobiz Dashboard](https://console.vobiz.ai).

When initializing the `Vobiz::Client`, pass your Auth ID as `api_key` and your Auth Token as `auth_token`. It is highly recommended to load your credentials from environment variables.

```ruby
require "vobiz"

# VOBIZ_AUTH_ID="YOUR_AUTH_ID"
# VOBIZ_AUTH_TOKEN="YOUR_AUTH_TOKEN"

client = Vobiz::Client.new(
  api_key: ENV["VOBIZ_AUTH_ID"],       # Maps to the X-Auth-ID header
  auth_token: ENV["VOBIZ_AUTH_TOKEN"]  # Maps to the X-Auth-Token header
)
```

---

## Quickstart

This example demonstrates how to initiate an outbound call. When the callee answers, Vobiz will fetch the `answer_url` you provide, which should return [VobizXML](https://docs.vobiz.ai/xml-builder) to define the call flow.

```ruby
require "vobiz"

client = Vobiz::Client.new(
  api_key: ENV["VOBIZ_AUTH_ID"],
  auth_token: ENV["VOBIZ_AUTH_TOKEN"]
)

# Your Auth ID is also required as a parameter for most API calls
auth_id = ENV["VOBIZ_AUTH_ID"]

begin
  response = client.calls.make_call(
    auth_id: auth_id,
    from: "14155551234", # Your Vobiz-provisioned phone number
    to: "+919876543210", # The destination phone number
    answer_url: "https://example.com/answer", # VobizXML webhook URL
    answer_method: "POST"
  )
  puts "Call initiated successfully! Call UUID: #{response.call_uuid}"
rescue Vobiz::ApiError => e
  puts "Error making call: #{e.message}"
end
```

---

## Common Operations

Here are more examples demonstrating common operations with the Vobiz Ruby SDK. For a complete list of methods, see [`reference.md`](./reference.md).

### 1. In-Call Text-to-Speech (TTS)

Convert text to speech and play it on an active call leg.

```ruby
begin
  client.speak_text.call(
    auth_id: auth_id,
    call_uuid: "YOUR_CALL_UUID",
    text: "Hello, your appointment is confirmed for tomorrow at 3 PM.",
    voice: "WOMAN",
    language: "en-US",
    legs: "aleg"
  )
  puts "Text-to-speech play request sent successfully."
rescue Vobiz::ApiError => e
  puts "Error playing TTS: #{e.message}"
end
```

### 2. Sub-Account Creation & KYC Verification

Create a new sub-account under your master account and verify its PAN (Permanent Account Number) details.

```ruby
begin
  # 1. Create the sub-account
  sub_account = client.sub_accounts.create_subaccount(
    auth_id: auth_id,
    name: "Customer Co",
    email: "customer@example.com",
    password: "Customer@12345",
    kyc_mode: "customer_use",
    business_type: "private_limited"
  )
  sub_auth_id = sub_account.auth_id
  puts "Sub-account created! Auth ID: #{sub_auth_id}"

  # 2. Run PAN verification for the sub-account
  verification = client.sub_account_kyc.verify_subaccount_pan(
    sub_auth_id: sub_auth_id,
    pan: "ABCDE1234F"
  )
  puts "PAN Verification Status: #{verification.status}"
rescue Vobiz::ApiError => e
  puts "Sub-account or KYC operation failed: #{e.message}"
end
```

### 3. SIP Trunking & Number Assignment

Create a new SIP Trunk and assign an existing phone number to route inbound calls through it.

```ruby
begin
  # 1. Create a SIP Trunk
  trunk = client.trunks.create_trunk(
    auth_id: auth_id,
    name: "Office Inbound Trunk",
    trunk_type: "INBOUND",
    max_concurrent_calls: 15
  )
  trunk_id = trunk.trunk_group_id
  puts "SIP Trunk created! ID: #{trunk_id}"

  # 2. Assign a phone number to the trunk (phone number must be URL-encoded)
  client.phone_numbers.assign_number_to_trunk(
    auth_id: auth_id,
    phone_number: "%2B912271264217", # URL-encoded +912271264217
    trunk_group_id: trunk_id
  )
  puts "Phone number assigned to trunk successfully."
rescue Vobiz::ApiError => e
  puts "SIP Trunk operation failed: #{e.message}"
end
```

### 4. List and Download Recordings

Retrieve call recordings associated with your account.

```ruby
begin
  recordings = client.recordings.list_recordings(
    auth_id: auth_id,
    limit: 10
  )
  
  puts "Available Recordings:"
  recordings.data.each do |recording|
    puts "  - ID: #{recording.recording_id}, Duration: #{recording.duration}s, URL: #{recording.recording_url}"
  end
rescue Vobiz::ApiError => e
  puts "Error listing recordings: #{e.message}"
end
```

---

## Configuration

The `Vobiz::Client` constructor allows for basic configuration of the HTTP client, such as configuring automatic retries with exponential backoff for transient network errors.

```ruby
client = Vobiz::Client.new(
  api_key: ENV["VOBIZ_AUTH_ID"],
  auth_token: ENV["VOBIZ_AUTH_TOKEN"],
  max_retries: 3 # Retry up to 3 times on transient errors (default is 0)
)
```

---

## Error Handling

The SDK throws `Vobiz::ApiError` for any non-2xx HTTP responses from the API. You can inspect the exception to get the HTTP status code and the raw response body.

```ruby
begin
  client.calls.make_call(
    auth_id: auth_id,
    from: "invalid_number",
    to: "+919876543210",
    answer_url: "https://example.com/answer",
    answer_method: "POST"
  )
rescue Vobiz::ApiError => e
  puts "API Error Occurred!"
  puts "Message: #{e.message}"
  puts "Status Code: #{e.status_code}"
  puts "Raw Body: #{e.body}"
rescue StandardError => e
  puts "An unexpected network or runtime error occurred: #{e.message}"
end
```

---

## Pagination

Many list endpoints in the Vobiz API support pagination. Depending on the specific resource, you will use either `page` and `per_page` parameters, or `limit` and `offset` parameters.

```ruby
# Using page and per_page (e.g., CDRs)
cdrs = client.cdr.list_cdrs(
  auth_id: auth_id,
  page: 1,
  per_page: 50
)

# Using limit and offset (e.g., Phone Numbers)
numbers = client.phone_numbers.list_numbers(
  auth_id: auth_id,
  limit: 20,
  offset: 0
)
```

---

## Other Vobiz SDKs

Vobiz provides official SDKs for several popular programming languages:

| Language | Repository |
|---|---|
| Node.js / TypeScript | [vobiz-ai/Vobiz-Node-SDK](https://github.com/vobiz-ai/Vobiz-Node-SDK) |
| Python | [vobiz-ai/Vobiz-Python-SDK](https://github.com/vobiz-ai/Vobiz-Python-SDK) |
| Go | [vobiz-ai/Vobiz-Go-SDK](https://github.com/vobiz-ai/Vobiz-Go-SDK) |
| C# / .NET | [vobiz-ai/Vobiz-Csharp-sdk](https://github.com/vobiz-ai/Vobiz-Csharp-sdk) |
| Java | [vobiz-ai/Vobiz-Java-SDK](https://github.com/vobiz-ai/Vobiz-Java-SDK) |
| PHP | [vobiz-ai/Vobiz-PHP-SDK](https://github.com/vobiz-ai/Vobiz-PHP-SDK) |

---

## Support

If you encounter any issues or have questions about using the SDK, please refer to the [Vobiz API Documentation](https://docs.vobiz.ai) or check your [Vobiz Dashboard](https://console.vobiz.ai) for account-specific details.

---

## License

This SDK is distributed under the MIT License. See the LICENSE file for more information.
