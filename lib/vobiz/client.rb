# frozen_string_literal: true

module Vobiz
  class Client
    # @param username [String]
    # @param password [String]
    # @param base_url [String, nil]
    # @param max_retries [Integer]
    #
    # @return [void]
    def initialize(username:, password:, base_url: nil, max_retries: 2)
      headers = {
        "X-Fern-Language" => "Ruby"
      }
      headers["Authorization"] = "Basic #{Base64.strict_encode64("#{username}:#{password}")}"
      @raw_client = Vobiz::Internal::Http::RawClient.new(
        base_url: base_url || Vobiz::Environment::PRODUCTION,
        headers: headers,
        max_retries: max_retries
      )
    end

    # @return [Vobiz::Account::Client]
    def account
      @account ||= Vobiz::Account::Client.new(client: @raw_client)
    end

    # @return [Vobiz::Balance::Client]
    def balance
      @balance ||= Vobiz::Balance::Client.new(client: @raw_client)
    end

    # @return [Vobiz::LiveCalls::Client]
    def live_calls
      @live_calls ||= Vobiz::LiveCalls::Client.new(client: @raw_client)
    end

    # @return [Vobiz::Calls::Client]
    def calls
      @calls ||= Vobiz::Calls::Client.new(client: @raw_client)
    end

    # @return [Vobiz::Cdr::Client]
    def cdr
      @cdr ||= Vobiz::Cdr::Client.new(client: @raw_client)
    end

    # @return [Vobiz::SubAccounts::Client]
    def sub_accounts
      @sub_accounts ||= Vobiz::SubAccounts::Client.new(client: @raw_client)
    end

    # @return [Vobiz::SubAccountKyc::Client]
    def sub_account_kyc
      @sub_account_kyc ||= Vobiz::SubAccountKyc::Client.new(client: @raw_client)
    end

    # @return [Vobiz::SubAccountKycTestMode::Client]
    def sub_account_kyc_test_mode
      @sub_account_kyc_test_mode ||= Vobiz::SubAccountKycTestMode::Client.new(client: @raw_client)
    end

    # @return [Vobiz::PhoneNumbers::Client]
    def phone_numbers
      @phone_numbers ||= Vobiz::PhoneNumbers::Client.new(client: @raw_client)
    end

    # @return [Vobiz::Trunks::Client]
    def trunks
      @trunks ||= Vobiz::Trunks::Client.new(client: @raw_client)
    end

    # @return [Vobiz::Conference::Client]
    def conference
      @conference ||= Vobiz::Conference::Client.new(client: @raw_client)
    end

    # @return [Vobiz::RecordCalls::Client]
    def record_calls
      @record_calls ||= Vobiz::RecordCalls::Client.new(client: @raw_client)
    end

    # @return [Vobiz::PlayAudio::Client]
    def play_audio
      @play_audio ||= Vobiz::PlayAudio::Client.new(client: @raw_client)
    end

    # @return [Vobiz::SpeakText::Client]
    def speak_text
      @speak_text ||= Vobiz::SpeakText::Client.new(client: @raw_client)
    end

    # @return [Vobiz::Dtmf::Client]
    def dtmf
      @dtmf ||= Vobiz::Dtmf::Client.new(client: @raw_client)
    end

    # @return [Vobiz::AudioStreams::Client]
    def audio_streams
      @audio_streams ||= Vobiz::AudioStreams::Client.new(client: @raw_client)
    end

    # @return [Vobiz::Conferences::Client]
    def conferences
      @conferences ||= Vobiz::Conferences::Client.new(client: @raw_client)
    end

    # @return [Vobiz::ConferenceMembers::Client]
    def conference_members
      @conference_members ||= Vobiz::ConferenceMembers::Client.new(client: @raw_client)
    end

    # @return [Vobiz::ConferenceRecording::Client]
    def conference_recording
      @conference_recording ||= Vobiz::ConferenceRecording::Client.new(client: @raw_client)
    end

    # @return [Vobiz::Recordings::Client]
    def recordings
      @recordings ||= Vobiz::Recordings::Client.new(client: @raw_client)
    end

    # @return [Vobiz::Credentials::Client]
    def credentials
      @credentials ||= Vobiz::Credentials::Client.new(client: @raw_client)
    end

    # @return [Vobiz::IPAccessControlList::Client]
    def ip_access_control_list
      @ip_access_control_list ||= Vobiz::IPAccessControlList::Client.new(client: @raw_client)
    end

    # @return [Vobiz::OriginationURI::Client]
    def origination_uri
      @origination_uri ||= Vobiz::OriginationURI::Client.new(client: @raw_client)
    end

    # @return [Vobiz::Applications::Client]
    def applications
      @applications ||= Vobiz::Applications::Client.new(client: @raw_client)
    end

    # @return [Vobiz::Endpoints::Client]
    def endpoints
      @endpoints ||= Vobiz::Endpoints::Client.new(client: @raw_client)
    end

    # @return [Vobiz::PartnerAPI::Client]
    def partner_api
      @partner_api ||= Vobiz::PartnerAPI::Client.new(client: @raw_client)
    end
  end
end
