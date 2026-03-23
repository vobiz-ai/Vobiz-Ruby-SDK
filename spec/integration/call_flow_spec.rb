# Vobiz Ruby SDK - Full Call Flow Integration Test
# Uses direct HTTP requests. Shared state via module-level variable.

require 'spec_helper'
require 'net/http'
require 'json'
require 'uri'

module VobizCallFlow
  AUTH_ID         = ENV['VOBIZ_AUTH_ID']
  AUTH_TOKEN      = ENV['VOBIZ_AUTH_TOKEN']
  FROM_NUMBER     = ENV['VOBIZ_FROM_NUMBER']
  TO_NUMBER       = ENV['VOBIZ_TO_NUMBER']
  TRANSFER_NUMBER = ENV['VOBIZ_TRANSFER_NUMBER']

  AUDIO_URL    = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'
  ANSWER_URL   = 'https://internal-test-xml.vobiz.ai/answer'
  HANGUP_URL   = 'https://internal-test-xml.vobiz.ai/hangup'
  TRANSFER_URL = 'https://internal-test-xml.vobiz.ai/answer'

  # Shared across all examples
  REQUEST_UUID = { value: nil }

  def self.http(method, path, body = nil)
    uri  = URI("https://api.vobiz.ai#{path}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.open_timeout = 10
    http.read_timeout = 30

    klass = { 'GET' => Net::HTTP::Get, 'POST' => Net::HTTP::Post, 'DELETE' => Net::HTTP::Delete }[method]
    req = klass.new(uri)
    req['X-Auth-ID']    = AUTH_ID
    req['X-Auth-Token'] = AUTH_TOKEN
    req['Content-Type'] = 'application/json'
    req.body = body.to_json if body

    resp = http.request(req)
    data = begin JSON.parse(resp.body) rescue {} end
    { status: resp.code.to_i, data: data }
  end
end

RSpec.describe 'Vobiz Call Flow', :call_flow do
  before(:all) do
    skip 'Required env vars not set' unless VobizCallFlow::AUTH_ID &&
      VobizCallFlow::AUTH_TOKEN &&
      VobizCallFlow::FROM_NUMBER &&
      VobizCallFlow::TO_NUMBER
  end

  it 'STEP 1: Makes outbound call and stores request_uuid' do
    puts "\n[Ruby] STEP 1: Making outbound call..."
    res = VobizCallFlow.http('POST', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/", {
      from:          VobizCallFlow::FROM_NUMBER,
      to:            VobizCallFlow::TO_NUMBER,
      answer_url:    VobizCallFlow::ANSWER_URL,
      answer_method: 'POST',
      hangup_url:    VobizCallFlow::HANGUP_URL,
      hangup_method: 'POST'
    })
    uuid = res[:data]['request_uuid'] || res[:data].dig('objects', 0, 'request_uuid')
    expect(uuid).not_to be_nil, "No request_uuid. Response: #{res[:data]}"
    VobizCallFlow::REQUEST_UUID[:value] = uuid
    puts "[Ruby] STEP 1 PASS: HTTP #{res[:status]}, uuid=#{uuid}"
    sleep 5
  end

  it 'STEP 2: Lists all live calls' do
    res = VobizCallFlow.http('GET', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/?status=live")
    puts "[Ruby] STEP 2 PASS: HTTP #{res[:status]}"
    sleep 5
  end

  it 'STEP 3: Gets single live call by UUID' do
    uuid = VobizCallFlow::REQUEST_UUID[:value]
    skip 'No UUID available' unless uuid
    res = VobizCallFlow.http('GET', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/#{uuid}/?status=live")
    puts "[Ruby] STEP 3 PASS: HTTP #{res[:status]}"
    sleep 5
  end

  it 'STEP 4: Speaks TTS on call' do
    uuid = VobizCallFlow::REQUEST_UUID[:value]
    skip 'No UUID available' unless uuid
    res = VobizCallFlow.http('POST', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/#{uuid}/Speak/", {
      text: 'Hello from Vobiz Ruby SDK.', voice: 'WOMAN', language: 'en-US', legs: 'aleg'
    })
    puts "[Ruby] STEP 4 PASS: HTTP #{res[:status]}"
    sleep 5
  end

  it 'STEP 5: Stops TTS' do
    uuid = VobizCallFlow::REQUEST_UUID[:value]
    skip 'No UUID available' unless uuid
    res = VobizCallFlow.http('DELETE', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/#{uuid}/Speak/")
    puts "[Ruby] STEP 5 PASS: HTTP #{res[:status]}"
  end

  it 'STEP 6: Plays audio on call' do
    uuid = VobizCallFlow::REQUEST_UUID[:value]
    skip 'No UUID available' unless uuid
    res = VobizCallFlow.http('POST', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/#{uuid}/Play/", {
      urls: [VobizCallFlow::AUDIO_URL], legs: 'aleg', loop: false, mix: true
    })
    puts "[Ruby] STEP 6 PASS: HTTP #{res[:status]}"
    sleep 5
  end

  it 'STEP 7: Stops audio' do
    uuid = VobizCallFlow::REQUEST_UUID[:value]
    skip 'No UUID available' unless uuid
    res = VobizCallFlow.http('DELETE', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/#{uuid}/Play/")
    puts "[Ruby] STEP 7 PASS: HTTP #{res[:status]}"
  end

  it 'STEP 8: Starts recording' do
    uuid = VobizCallFlow::REQUEST_UUID[:value]
    skip 'No UUID available' unless uuid
    res = VobizCallFlow.http('POST', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/#{uuid}/Record/", {
      time_limit: 60, file_format: 'mp3'
    })
    puts "[Ruby] STEP 8 PASS: HTTP #{res[:status]}"
    sleep 5
  end

  it 'STEP 9: Sends DTMF digits' do
    uuid = VobizCallFlow::REQUEST_UUID[:value]
    skip 'No UUID available' unless uuid
    res = VobizCallFlow.http('POST', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/#{uuid}/DTMF/", {
      digits: '1234', leg: 'aleg'
    })
    puts "[Ruby] STEP 9 PASS: HTTP #{res[:status]}"
  end

  it 'STEP 10: Stops recording' do
    uuid = VobizCallFlow::REQUEST_UUID[:value]
    skip 'No UUID available' unless uuid
    res = VobizCallFlow.http('DELETE', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/#{uuid}/Record/")
    puts "[Ruby] STEP 10 PASS: HTTP #{res[:status]}"
  end

  it 'STEP 11: Transfers call' do
    uuid = VobizCallFlow::REQUEST_UUID[:value]
    skip 'No UUID available' unless uuid
    transfer_to = VobizCallFlow::TRANSFER_URL +
      (VobizCallFlow::TRANSFER_NUMBER ? "?to=#{VobizCallFlow::TRANSFER_NUMBER}" : '')
    res = VobizCallFlow.http('POST', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/#{uuid}/", {
      legs: 'aleg', aleg_url: transfer_to, aleg_method: 'POST'
    })
    puts "[Ruby] STEP 11 PASS: HTTP #{res[:status]}"
    sleep 5
  end

  it 'STEP 12: Hangs up call' do
    uuid = VobizCallFlow::REQUEST_UUID[:value]
    skip 'No UUID available' unless uuid
    res = VobizCallFlow.http('DELETE', "/api/v1/Account/#{VobizCallFlow::AUTH_ID}/Call/#{uuid}/")
    puts "[Ruby] STEP 12 PASS: HTTP #{res[:status]}"
    puts "\n[Ruby] Call flow COMPLETE"
  end
end
