#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/vobiz'

AUTH_ID = ENV['VOBIZ_AUTH_ID']
AUTH_TOKEN = ENV['VOBIZ_AUTH_TOKEN']
FROM = ENV['FROM_NUMBER']
TO = ENV['TO_NUMBER']
ANSWER_URL = ENV['VOBIZ_XML_ANSWER_URL']
HANGUP_URL = ENV['VOBIZ_HANGUP_URL']

required = {
  'VOBIZ_AUTH_ID' => AUTH_ID,
  'VOBIZ_AUTH_TOKEN' => AUTH_TOKEN,
  'FROM_NUMBER' => FROM,
  'TO_NUMBER' => TO
}

missing = required.select { |_k, v| v.to_s.empty? }.keys
unless missing.empty?
  warn "Missing required env vars: #{missing.join(', ')}"
  exit 1
end

client = Vobiz::Client.new(AUTH_ID, AUTH_TOKEN, debug: ENV['VOBIZ_DEBUG'] == 'true')

passed = 0
failed = 0


def report_ok(name, endpoint = nil, payload = nil, data = nil)
  puts "\e[32m✓\e[0m #{name}"
  puts "  endpoint: #{endpoint}" if endpoint
  puts "  payload: #{payload.inspect}" if payload
  puts "  \e[90m#{data.inspect[0...180]}\e[0m" if data
end

def report_fail(name, err, endpoint = nil, payload = nil)
  puts "\e[31m✗\e[0m #{name}"
  puts "  endpoint: #{endpoint}" if endpoint
  puts "  payload: #{payload.inspect}" if payload
  puts "  \e[31m#{err.message}\e[0m"
end

def step(name)
  puts "\n[#{name}]"
end

puts "\n=============================================="
puts 'Vobiz Ruby SDK — Live Call Endpoint Test'
puts '=============================================='

request_uuid = nil
call_uuid = nil

step('1. Pre-check live/queued lists')
begin
  report_ok('calls.list_live_calls', 'GET /api/v1/Account/{authId}/Call/?status=live', nil, client.calls.list_live_calls)
  passed += 1
rescue StandardError => e
  report_fail('calls.list_live_calls', e, 'GET /api/v1/Account/{authId}/Call/?status=live')
  failed += 1
end

begin
  report_ok('calls.list_queued_calls', 'GET /api/v1/Account/{authId}/Call/?status=queued', nil, client.calls.list_queued_calls)
  passed += 1
rescue StandardError => e
  report_fail('calls.list_queued_calls', e, 'GET /api/v1/Account/{authId}/Call/?status=queued')
  failed += 1
end

if ANSWER_URL.to_s.empty?
  puts "\n[2. Live call create/control]"
  puts '⚠️  VOBIZ_XML_ANSWER_URL not set. Running in read-only mode; create/control steps are skipped.'
  puts '    Set VOBIZ_XML_ANSWER_URL (+ optional VOBIZ_HANGUP_URL) to run full live-call control tests.'
else
  step('2. Create outbound call')
  create_payload = {
    from: FROM,
    to: TO,
    answer_url: ANSWER_URL,
    hangup_url: HANGUP_URL,
    hangup_method: 'POST'
  }
  begin
    created = client.calls.create(
      FROM,
      TO,
      ANSWER_URL,
      {
        hangup_url: HANGUP_URL,
        hangup_method: 'POST'
      }
    )
    request_uuid = created['requestUuid'] || created['request_uuid']
    call_uuid = created['callUuid'] || created['call_uuid'] || request_uuid
    report_ok('calls.create', 'POST /api/v1/Account/{authId}/Call/', create_payload, created)
    passed += 1
  rescue StandardError => e
    report_fail('calls.create', e, 'POST /api/v1/Account/{authId}/Call/', create_payload)
    failed += 1
    puts "\nSUMMARY: PASSED=#{passed}, FAILED=#{failed}"
    exit 1
  end

  sleep 3

  step('3. Live call actions')
  if call_uuid && !call_uuid.to_s.empty?
    begin
      report_ok('calls.get_live_call', 'GET /api/v1/Account/{authId}/Call/{callUuid}/?status=live', { call_uuid: call_uuid }, client.calls.get_live_call(call_uuid))
      passed += 1
    rescue StandardError => e
      report_fail('calls.get_live_call', e, 'GET /api/v1/Account/{authId}/Call/{callUuid}/?status=live', { call_uuid: call_uuid })
      failed += 1
    end

    begin
      report_ok('calls.record', 'POST /api/v1/Account/{authId}/Call/{callUuid}/Record/', { call_uuid: call_uuid, file_format: 'mp3' }, client.calls.record(call_uuid, file_format: 'mp3'))
      passed += 1
    rescue StandardError => e
      report_fail('calls.record', e, 'POST /api/v1/Account/{authId}/Call/{callUuid}/Record/', { call_uuid: call_uuid, file_format: 'mp3' })
      failed += 1
    end

    sleep 1

    begin
      report_ok('calls.speak_text', 'POST /api/v1/Account/{authId}/Call/{callUuid}/Speak/', { call_uuid: call_uuid, text: 'Hello from Vobiz Ruby SDK test' }, client.calls.speak_text(call_uuid, 'Hello from Vobiz Ruby SDK test'))
      passed += 1
    rescue StandardError => e
      report_fail('calls.speak_text', e, 'POST /api/v1/Account/{authId}/Call/{callUuid}/Speak/', { call_uuid: call_uuid, text: 'Hello from Vobiz Ruby SDK test' })
      failed += 1
    end

    sleep 2

    begin
      report_ok('calls.stop_speaking_text', 'DELETE /api/v1/Account/{authId}/Call/{callUuid}/Speak/', { call_uuid: call_uuid }, client.calls.stop_speaking_text(call_uuid))
      passed += 1
    rescue StandardError => e
      report_fail('calls.stop_speaking_text', e, 'DELETE /api/v1/Account/{authId}/Call/{callUuid}/Speak/', { call_uuid: call_uuid })
      failed += 1
    end

    begin
      report_ok('calls.send_digits', 'POST /api/v1/Account/{authId}/Call/{callUuid}/DTMF/', { call_uuid: call_uuid, digits: '1234' }, client.calls.send_digits(call_uuid, '1234'))
      passed += 1
    rescue StandardError => e
      report_fail('calls.send_digits', e, 'POST /api/v1/Account/{authId}/Call/{callUuid}/DTMF/', { call_uuid: call_uuid, digits: '1234' })
      failed += 1
    end

    begin
      report_ok('calls.stop_recording', 'DELETE /api/v1/Account/{authId}/Call/{callUuid}/Record/', { call_uuid: call_uuid }, client.calls.stop_recording(call_uuid))
      passed += 1
    rescue StandardError => e
      report_fail('calls.stop_recording', e, 'DELETE /api/v1/Account/{authId}/Call/{callUuid}/Record/', { call_uuid: call_uuid })
      failed += 1
    end

    begin
      report_ok('calls.hangup', 'DELETE /api/v1/Account/{authId}/Call/{callUuid}/', { call_uuid: call_uuid }, client.calls.hangup(call_uuid))
      passed += 1
    rescue StandardError => e
      report_fail('calls.hangup', e, 'DELETE /api/v1/Account/{authId}/Call/{callUuid}/', { call_uuid: call_uuid })
      failed += 1
    end
  else
    warn 'No call UUID available after create; skipping live-call action tests.'
  end

  sleep 3

  step('4. Post-check live list')
  begin
    report_ok('calls.list_live_calls(post)', 'GET /api/v1/Account/{authId}/Call/?status=live', nil, client.calls.list_live_calls)
    passed += 1
  rescue StandardError => e
    report_fail('calls.list_live_calls(post)', e, 'GET /api/v1/Account/{authId}/Call/?status=live')
    failed += 1
  end

  step('5. Best-effort queued cancel')
  if request_uuid && !request_uuid.to_s.empty?
    begin
      report_ok('calls.cancel(request_uuid)', 'DELETE /api/v1/Account/{authId}/Call/{requestUuid}/?status=queued', { request_uuid: request_uuid }, client.calls.cancel(request_uuid))
      passed += 1
    rescue StandardError => e
      report_fail('calls.cancel(request_uuid)', e, 'DELETE /api/v1/Account/{authId}/Call/{requestUuid}/?status=queued', { request_uuid: request_uuid })
      # may fail if already connected/completed; informational only
    end
  end
end

puts "\n================ SUMMARY ================"
puts "PASSED: #{passed}"
puts "FAILED: #{failed}"
puts '========================================='

exit(failed.zero? ? 0 : 1)
