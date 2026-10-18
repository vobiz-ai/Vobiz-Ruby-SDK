# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Whether a phone number is on your opt-out list for the channel you asked about.
      class OptOutCheck < Internal::Types::Model
        field :opted_out, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "optedOut"
      end
    end
  end
end
