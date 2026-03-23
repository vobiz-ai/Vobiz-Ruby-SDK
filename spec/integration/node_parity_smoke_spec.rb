require 'spec_helper'

RSpec.describe 'Node parity smoke' do
  it 'builds XML payloads' do
    xml = Vobiz::XML.gather(prompt: 'hello')
    expect(xml).to include('<Gather')
    expect(xml).to include('<Speak voice="WOMAN" language="en-US">hello</Speak>')

    dial_xml = Vobiz::XML.dial(phone_number: '+14155550100')
    expect(dial_xml).to include('<Dial')

    speak_xml = Vobiz::XML.speak(text: 'hello world')
    expect(speak_xml).to include('<Speak')
  end

  it 'creates a JWT with voice grants' do
    token = Vobiz::AccessToken.new('AUTHID', 'AUTHTOKEN', 'user1')
      .add_voice_grants(true, true)
      .to_jwt

    expect(token.split('.').length).to eq(3)
  end

  it 'initializes node-style client' do
    client = Vobiz::Client.new('AUTHID', 'AUTHTOKEN')
    expect(client.respond_to?(:calls)).to be(true)
    expect(client.respond_to?(:trunks)).to be(true)
    expect(client.respond_to?(:origination_uris)).to be(true)
    expect(client.respond_to?(:messages)).to be(true)
  end
end
