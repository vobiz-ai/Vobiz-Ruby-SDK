require 'spec_helper'
require 'rexml/document'

RSpec.describe 'Internal Vobiz server checks', :integration do
  auth_id = ENV['VOBIZ_AUTH_ID']
  auth_token = ENV['VOBIZ_AUTH_TOKEN']

  before(:all) do
    skip 'VOBIZ_AUTH_ID or VOBIZ_AUTH_TOKEN not set' unless ENV['VOBIZ_AUTH_ID'] && ENV['VOBIZ_AUTH_TOKEN']

    @client = Vobiz::Client.new(ENV['VOBIZ_AUTH_ID'], ENV['VOBIZ_AUTH_TOKEN'])
  end

  it 'hits modern endpoint: account.get_profile' do
    response = @client.account.get_profile
    expect(response).to be_a(Hash)
  end

  it 'hits modern endpoint: trunks.list' do
    response = @client.trunks.list(limit: 5, offset: 0)
    expect(response).to satisfy { |v| v.is_a?(Hash) || v.is_a?(Array) }
  end

  it 'hits legacy endpoint: calls.list_live_calls' do
    response = @client.calls.list_live_calls
    expect(response).to satisfy { |v| v.is_a?(Hash) || v.is_a?(Array) }
  end

  it 'builds valid XML for all XML generators' do
    xml_payloads = [
      Vobiz::XML.play('https://example.com/a.mp3'),
      Vobiz::XML.wait(length: 1),
      Vobiz::XML.hangup,
      Vobiz::XML.redirect('https://example.com/next'),
      Vobiz::XML.dtmf(digits: '1234'),
      Vobiz::XML.preanswer(audio_url: 'https://example.com/pre.mp3'),
      Vobiz::XML.stream(stream_url: 'wss://example.com/stream'),
      Vobiz::XML.conference(conference_name: 'room-1'),
      Vobiz::XML.dial(phone_number: '+14155550100'),
      Vobiz::XML.gather(prompt: 'Press one'),
      Vobiz::XML.record,
      Vobiz::XML.speak(text: 'hello'),
      Vobiz::XML.speak_and_wait(text: 'hello', wait_length: 1)
    ]

    xml_payloads.each do |payload|
      expect { REXML::Document.new(payload) }.not_to raise_error
      expect(payload).to include('<Response>')
    end

    ssml = Vobiz::XML.ssml(text: 'hello', rate: 'medium', breaks: 1)
    expect(ssml).to include('<prosody')
  end

  it 'hits call create endpoint using a Vobiz XML answer URL when configured' do
    from = ENV['TEST_FROM_NUMBER']
    to = ENV['TEST_TO_NUMBER']
    answer_url = ENV['VOBIZ_XML_ANSWER_URL']
    hangup_url = ENV['VOBIZ_HANGUP_URL']

    skip 'TEST_FROM_NUMBER, TEST_TO_NUMBER, VOBIZ_XML_ANSWER_URL not set' unless from && to && answer_url

    result = @client.calls.create(
      from,
      to,
      answer_url,
      hangup_url: hangup_url,
      hangup_method: 'POST'
    )

    expect(result).to be_a(Hash)
    request_uuid = result['requestUuid'] || result['request_uuid']
    expect(request_uuid).not_to be_nil

    begin
      @client.calls.cancel(request_uuid) if request_uuid
    rescue StandardError
      # best-effort cleanup only
    end
  end
end
