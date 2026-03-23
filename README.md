# Vobiz Ruby SDK

Official Ruby SDK for the [Vobiz](https://vobiz.ai) Voice & Telephony API.

Make outbound calls, manage SIP trunks, phone numbers, conferences, recordings, and build dynamic call flows with VobizXML — all from Ruby.

---

## Installation

Add to your Gemfile:

```ruby
gem 'vobiz'
```

Then run:

```bash
bundle install
```

Or install directly:

```bash
gem install vobiz
```

---

## Authentication

```ruby
require 'vobiz'

client = Vobiz::Client.new('YOUR_AUTH_ID', 'YOUR_AUTH_TOKEN')
```

Or use environment variables:

```bash
export VOBIZ_AUTH_ID=your_auth_id
export VOBIZ_AUTH_TOKEN=your_auth_token
```

```ruby
client = Vobiz::Client.new
```

---

## Quick Start

### Make an Outbound Call

```ruby
require 'vobiz'

client = Vobiz::Client.new('YOUR_AUTH_ID', 'YOUR_AUTH_TOKEN')

call = client.calls.create(
  from:          '+1xxxxxxxxxx',
  to:            '+1xxxxxxxxxx',
  answer_url:    'https://yourserver.com/answer',
  answer_method: 'POST',
  hangup_url:    'https://yourserver.com/hangup',
  hangup_method: 'POST'
)

puts "Call UUID: #{call[:request_uuid]}"
```

---

## Features

### Calls

```ruby
# List live calls
live_calls = client.calls.list(status: 'live')

# Get a specific call
call = client.calls.get('call-uuid')

# Speak TTS on a live call
client.calls.speak_text('call-uuid',
  text:     'Hello from Vobiz!',
  voice:    'WOMAN',
  language: 'en-US',
  legs:     'aleg'
)

# Play audio on a live call
client.calls.play_music('call-uuid',
  urls: ['https://example.com/audio.mp3'],
  legs: 'aleg'
)

# Start recording
client.calls.record('call-uuid',
  time_limit:  60,
  file_format: 'mp3'
)

# Send DTMF digits
client.calls.send_digits('call-uuid', digits: '1234', leg: 'aleg')

# Stop recording
client.calls.stop_recording('call-uuid')

# Transfer call
client.calls.transfer('call-uuid',
  legs:        'aleg',
  aleg_url:    'https://yourserver.com/transfer',
  aleg_method: 'POST'
)

# Hang up
client.calls.hangup('call-uuid')
```

### Conferences

```ruby
# List conferences
conferences = client.conferences.list

# Kick a member
client.conferences.members.delete('conference-name', 'member-id')

# Mute a member
client.conferences.members.mute('conference-name', 'member-id')

# Record a conference
client.conferences.record('conference-name', file_format: 'mp3')
```

### Recordings

```ruby
# List recordings
recordings = client.recordings.list

# Get a recording
rec = client.recordings.get('recording-uuid')

# Delete a recording
client.recordings.delete('recording-uuid')
```

### Account

```ruby
# Get account details
account = client.account.get

# Get balance
balance = client.account.balance
```

### Phone Numbers

```ruby
# Search available numbers
available = client.numbers.search(country_iso: 'US', type: 'local')

# Purchase a number
number = client.numbers.purchase(number: '+1xxxxxxxxxx')

# List owned numbers
owned = client.numbers.list
```

### Applications

```ruby
# Create application
app = client.applications.create(
  app_name:   'My App',
  answer_url: 'https://yourserver.com/answer',
  hangup_url: 'https://yourserver.com/hangup'
)

# List applications
apps = client.applications.list

# Update
client.applications.update('app-uuid', answer_url: 'https://newserver.com/answer')

# Delete
client.applications.delete('app-uuid')
```

### Sub-Accounts

```ruby
sub  = client.subaccounts.create(name: 'Sub Account 1')
subs = client.subaccounts.list
```

---

## VobizXML

Build dynamic call flow XML responses:

```ruby
require 'vobiz/xml'

response = Vobiz::XML::Response.new
response.add_speak('Welcome to Vobiz!', voice: 'WOMAN', language: 'en-US')
response.add_record(action: 'https://yourserver.com/recording', max_length: 30)

puts response.to_xml
```

Output:
```xml
<Response>
  <Speak voice="WOMAN" language="en-US">Welcome to Vobiz!</Speak>
  <Record action="https://yourserver.com/recording" maxLength="30"/>
</Response>
```

---

## Error Handling

```ruby
begin
  call = client.calls.create(from: '+1xxx', to: '+1yyy', answer_url: 'https://...')
rescue Vobiz::RestError => e
  puts "API Error #{e.status_code}: #{e.message}"
end
```

---

## Requirements

- Ruby 2.7+

---

## Support

- Docs: [https://docs.vobiz.ai](https://docs.vobiz.ai)
- Console: [https://console.vobiz.ai](https://console.vobiz.ai)
- Email: support@vobiz.ai
