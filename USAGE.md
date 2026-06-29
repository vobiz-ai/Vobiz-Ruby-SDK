# Vobiz Ruby SDK — Usage Sheet

Common operations. Full reference: [`reference.md`](./reference.md).

All snippets assume:

```ruby
require "vobiz"

client = Vobiz::Client.new(api_key: "YOUR_AUTH_ID", auth_token: "YOUR_AUTH_TOKEN")
auth_id = "YOUR_AUTH_ID"
```

## Calls

```ruby
client.calls.make_call(
  auth_id: auth_id, from: "14155551234", to: "+919876543210",
  answer_url: "https://example.com/answer", answer_method: "POST"
)

client.live_calls.list_live_calls(auth_id: auth_id)
client.live_calls.get_live_call(auth_id: auth_id, call_uuid: "CALL_UUID")
client.live_calls.hangup_call(auth_id: auth_id, call_uuid: "CALL_UUID")
```

## In-call actions

```ruby
client.play_audio.call(auth_id: auth_id, call_uuid: "CALL_UUID", ...)
client.speak_text.call(auth_id: auth_id, call_uuid: "CALL_UUID", ...)
client.dtmf.send_dtmf(auth_id: auth_id, call_uuid: "CALL_UUID", ...)
client.record_calls.start_recording(auth_id: auth_id, call_uuid: "CALL_UUID")
client.record_calls.stop_recording(auth_id: auth_id, call_uuid: "CALL_UUID")
```

## CDRs & Recordings

```ruby
client.cdr.list_cdrs(auth_id: auth_id)
client.cdr.search_cdrs(auth_id: auth_id)
client.cdr.get_cdr(auth_id: auth_id, call_id: "CALL_ID")
client.recordings.list_recordings(auth_id: auth_id)
client.recordings.get_recording(auth_id: auth_id, recording_id: "REC_ID")
```

## Phone Numbers

```ruby
client.phone_numbers.list_numbers(auth_id: auth_id)
client.phone_numbers.list_inventory_numbers(auth_id: auth_id)
client.phone_numbers.purchase_from_inventory(auth_id: auth_id, ...)
client.phone_numbers.assign_number_to_trunk(auth_id: auth_id, ...)
```

## Applications, Trunks, Endpoints

```ruby
client.applications.list_applications(auth_id: auth_id)
client.applications.create_application(auth_id: auth_id, ...)
client.trunks.list_trunks(auth_id: auth_id)
client.endpoints.list_endpoints(auth_id: auth_id)
```

## Conferences

```ruby
client.conferences.list_conferences(auth_id: auth_id)
client.conference_members.mute_member(auth_id: auth_id, ...)
client.conference.kick_member(auth_id: auth_id, ...)
```

## Account & Balance

```ruby
client.account.retrieve_account
client.balance.get_balance(auth_id: auth_id, currency: "INR")
client.balance.list_transactions(auth_id: auth_id)
```

> Exact request fields per method are in [`reference.md`](./reference.md) and at
> https://docs.vobiz.ai.
