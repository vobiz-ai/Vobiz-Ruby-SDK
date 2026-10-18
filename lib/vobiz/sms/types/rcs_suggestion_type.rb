# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module RcsSuggestionType
        extend Vobiz::Internal::Types::Enum

        REPLY = "REPLY"
        OPEN_URL = "OPEN_URL"
        DIAL_PHONE = "DIAL_PHONE"
        SHOW_LOCATION = "SHOW_LOCATION"
        REQUEST_LOCATION = "REQUEST_LOCATION"
      end
    end
  end
end
