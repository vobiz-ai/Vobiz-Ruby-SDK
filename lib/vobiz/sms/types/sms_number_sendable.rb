# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Where a number can send right now, derived from its country and registration state. Check it before you send.
      class SmsNumberSendable < Internal::Types::Model
        field :international, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :us_domestic, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "usDomestic"
      end
    end
  end
end
