# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A messaging-capable number on your account, with its registration state and what it can send.
      class SmsNumber < Internal::Types::Model
        field :e164, -> { String }, optional: true, nullable: false

        field :provider, -> { String }, optional: true, nullable: false

        field :country_code, -> { String }, optional: true, nullable: false, api_name: "countryCode"

        field :channels, -> { Internal::Types::Array[Vobiz::Sms::Types::SmsNumberChannelsItem] }, optional: true, nullable: false

        field :type, -> { String }, optional: true, nullable: false

        field :capabilities, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :ten_dlc, -> { Vobiz::Sms::Types::SmsNumberTenDlc }, optional: true, nullable: false, api_name: "tenDlc"

        field :toll_free, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "tollFree"

        field :registration, -> { Vobiz::Sms::Types::SmsNumberRegistration }, optional: true, nullable: false

        field :last_message, -> { Vobiz::Sms::Types::SmsNumberLastMessage }, optional: true, nullable: false, api_name: "lastMessage"

        field :sendable, -> { Vobiz::Sms::Types::SmsNumberSendable }, optional: true, nullable: false
      end
    end
  end
end
