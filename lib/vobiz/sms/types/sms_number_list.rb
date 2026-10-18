# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The messaging numbers on your account.
      class SmsNumberList < Internal::Types::Model
        field :numbers, -> { Internal::Types::Array[Vobiz::Sms::Types::SmsNumber] }, optional: true, nullable: false
      end
    end
  end
end
