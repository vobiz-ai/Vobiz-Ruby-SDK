# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module InvalidRecipientReason
        extend Vobiz::Internal::Types::Enum

        MISSING_PHONE_NUMBER = "missing phone number"
        CONTAINS_LETTERS_OR_SYMBOLS = "contains letters or symbols"
        TOO_SHORT = "too short"
        TOO_LONG = "too long"
        NOT_A_VALID_US_CANADA_NUMBER = "not a valid US/Canada number"
        NOT_A_VALID_INDIAN_MOBILE_NUMBER = "not a valid Indian mobile number"
        UNSUPPORTED_DEFAULT_COUNTRY = "unsupported defaultCountry"
      end
    end
  end
end
