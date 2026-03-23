# Ruby SDK Node Parity Guide

This guide documents the Node-SDK-parity layer implemented in Ruby.

## Entry points

- `Vobiz::Client` (alias of `Vobiz::SDK::Client`)
- `Vobiz::XML` (all XML builders)
- `Vobiz::AccessToken` (JWT helper)

## Authentication

```ruby
client = Vobiz::Client.new(
  ENV['VOBIZ_AUTH_ID'],
  ENV['VOBIZ_AUTH_TOKEN']
)
```

Supports env fallback:
- `VOBIZ_AUTH_ID`
- `VOBIZ_AUTH_TOKEN`

## Base URL routing (matches Node)

- Modern: `https://api.vobiz.ai/api/v1/account/{authId}`
- Legacy voice: `https://api.vobiz.ai/api/v1/Account/{authId}`

Legacy voice resources:
- `calls`, `recordings`, `conferences`, `endpoints`, `applications`, `messages`

Modern resources:
- `cdr`, `numbers`, `trunks`, `credentials`, `ip_acl`, `origination_uris`, `account`, `subaccounts`, `balance`

## Endpoint coverage

### Account
- `client.account.get`
- `client.account.get_profile`
- `client.account.get_transactions(params = {})`
- `client.account.get_balance(currency)`
- `client.account.get_concurrency`

### Balance
- `client.balance.get(currency = 'INR')`
- `client.balance.list_transactions(params = {})`
- `client.balance.get_concurrency`

### CDR
- `client.cdr.get(params = {})`
- `client.cdr.list(params = {})`

### Trunks
- `create`, `get`, `list`, `update`, `delete`

### Credentials
- `create`, `list`, `get`, `update`, `delete`

### IP ACL
- `create`, `list`, `get`, `update`, `delete`

### Origination URIs
- `create`, `list`, `get`, `update`, `delete`

### Numbers
- `list`
- `list_inventory`
- `purchase_from_inventory`
- `link_application`
- `unlink_application`
- `buy`
- `get`
- `add_own_number`
- `search`
- `update`
- `unrent`
- `assign`
- `unassign`

### Subaccounts
- `list`, `get`, `create`, `update`, `delete`

### Calls
- `create`, `get`, `list`
- `list_live_calls`, `get_live_call`
- `list_queued_calls`, `get_queued_call`
- `cancel`, `hangup`, `transfer`
- `record`, `stop_recording`
- `play_music`, `stop_playing_music`
- `speak_text`, `stop_speaking_text`
- `send_digits`
- `stream`, `stop_stream`, `stop_all_stream`, `get_stream`, `get_all_stream`

### Recordings
- `list`, `get`, `delete`, `export`, `bulk_delete`

### Conferences
- `list`, `get`, `hangup`, `hangup_all`
- `hangup_member`, `kick_member`
- `mute_member`, `unmute_member`
- `deaf_member`, `undeaf_member`
- `play_audio_to_member`, `stop_playing_audio_to_member`
- `speak_text_to_member`, `stop_speaking_text_to_member`
- `record`, `start_recording`, `stop_recording`

### Applications
- `list`, `get`, `create`, `update`, `delete`

### Endpoints
- `list`, `get`, `create`, `update`, `delete`

### Messages
- `send`, `create`, `get`, `list`, `list_media`

## XML coverage (`Vobiz::XML`)

Implemented XML functions:

- `play`
- `wait`
- `hangup`
- `redirect`
- `dtmf`
- `preanswer`
- `stream`
- `conference`
- `dial`
- `gather`
- `record`
- `speak`
- `ssml`
- `speak_and_wait`

All builders return XML strings.

## JWT helper

`Vobiz::AccessToken` supports:
- constructor validation
- `add_voice_grants(incoming, outgoing)`
- `to_jwt`

Header includes: `cty: vobiz;v=1`.

## Transport behavior parity

`Vobiz::SDK::Request` provides:
- headers: `X-Auth-ID`, `X-Auth-Token`, `User-Agent`, `Content-Type`
- timeout support
- optional proxy
- retry on `429` and `5xx` (max 3)
- `Retry-After` handling
- JSON response parsing + camelCase key conversion

## Quick XML example

```ruby
xml = Vobiz::XML.gather(
  action_url: 'https://example.com/menu-choice',
  prompt: 'Press 1 for Sales, 2 for Support'
)
```

## Quick voice example

```ruby
call = client.calls.create(
  '+911171366914',
  '+919148227303',
  'https://example.com/answer',
  hangup_url: 'https://example.com/hangup'
)

client.calls.speak_text(call['callUuid'], 'Welcome to Vobiz')
```

## Internal integration tests

File:
- [ruby-sdk/spec/integration/internal_vobiz_server_spec.rb](spec/integration/internal_vobiz_server_spec.rb)

This test validates:
- modern endpoint reachability
- legacy endpoint reachability
- XML generator outputs are valid XML
- optional live call create/cancel using a real Vobiz XML answer URL

Required env vars:
- `VOBIZ_AUTH_ID`
- `VOBIZ_AUTH_TOKEN`

Optional env vars (for live call test):
- `TEST_FROM_NUMBER`
- `TEST_TO_NUMBER`
- `VOBIZ_XML_ANSWER_URL`
- `VOBIZ_HANGUP_URL`
