# Vobiz Ruby SDK - Integration Tests (Read-Only)
# Run: bundle exec rspec spec/integration/vobiz_integration_spec.rb
# Requires: VOBIZ_AUTH_ID and VOBIZ_AUTH_TOKEN env vars

require 'spec_helper'

VOBIZ_AUTH_ID    = ENV['VOBIZ_AUTH_ID']
VOBIZ_AUTH_TOKEN = ENV['VOBIZ_AUTH_TOKEN']

RSpec.describe 'Vobiz SDK Integration Tests', :integration do
  before(:all) do
    skip 'VOBIZ_AUTH_ID or VOBIZ_AUTH_TOKEN not set' unless VOBIZ_AUTH_ID && VOBIZ_AUTH_TOKEN

    Vobiz.configure do |config|
      config.api_key['X-Auth-ID']    = VOBIZ_AUTH_ID
      config.api_key['X-Auth-Token'] = VOBIZ_AUTH_TOKEN
    end
  end

  describe 'AccountApi' do
    it 'GET /api/v1/auth/me does not raise an error' do
      api = Vobiz::AccountApi.new
      expect {
        api.api_v1_auth_me_get(
          x_auth_id: VOBIZ_AUTH_ID,
          x_auth_token: VOBIZ_AUTH_TOKEN
        )
      }.not_to raise_error
      puts "[Ruby] GetAccountDetails: OK"
    end
  end

  describe 'CallApi' do
    it 'GET live calls does not raise an error' do
      api = Vobiz::CallApi.new
      expect {
        api.api_v1_account_auth_id_call_get(
          VOBIZ_AUTH_ID,
          x_auth_id: VOBIZ_AUTH_ID,
          x_auth_token: VOBIZ_AUTH_TOKEN,
          status: 'live'
        )
      }.not_to raise_error
      puts "[Ruby] GetLiveCalls: OK"
    end
  end

  describe 'RecordingApi' do
    it 'GET recordings does not raise an error' do
      api = Vobiz::RecordingApi.new
      expect {
        api.api_v1_account_account_id_recording_get(
          VOBIZ_AUTH_ID,
          x_auth_id: VOBIZ_AUTH_ID,
          x_auth_token: VOBIZ_AUTH_TOKEN
        )
      }.not_to raise_error
      puts "[Ruby] ListRecordings: OK"
    end
  end

  describe 'ConferenceApi' do
    it 'GET conferences does not raise an error' do
      api = Vobiz::ConferenceApi.new
      expect {
        api.api_v1_account_auth_id_conference_get(
          VOBIZ_AUTH_ID,
          x_auth_id: VOBIZ_AUTH_ID,
          x_auth_token: VOBIZ_AUTH_TOKEN
        )
      }.not_to raise_error
      puts "[Ruby] ListConferences: OK"
    end
  end

  describe 'ApplicationApi' do
    it 'GET applications does not raise an error' do
      api = Vobiz::ApplicationApi.new
      expect {
        api.api_v1_account_auth_id_application_get(
          VOBIZ_AUTH_ID,
          x_auth_id: VOBIZ_AUTH_ID,
          x_auth_token: VOBIZ_AUTH_TOKEN
        )
      }.not_to raise_error
      puts "[Ruby] ListApplications: OK"
    end
  end
end
