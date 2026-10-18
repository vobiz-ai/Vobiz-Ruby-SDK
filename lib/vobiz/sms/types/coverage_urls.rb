# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Rules for links in message bodies sent to a destination country.
      class CoverageURLs < Internal::Types::Model
        field :allowed, -> { Vobiz::Sms::Types::LocalIntl }, optional: true, nullable: false

        field :whitelisting_required, -> { Vobiz::Sms::Types::LocalIntl }, optional: true, nullable: false, api_name: "whitelistingRequired"
      end
    end
  end
end
