# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Which sender types a destination accepts, each split into local and international traffic.
      class CoverageSenders < Internal::Types::Model
        field :alphanumeric, -> { Vobiz::Sms::Types::LocalIntl }, optional: true, nullable: false

        field :short_code, -> { Vobiz::Sms::Types::LocalIntl }, optional: true, nullable: false, api_name: "shortCode"

        field :long_number, -> { Vobiz::Sms::Types::LocalIntl }, optional: true, nullable: false, api_name: "longNumber"
      end
    end
  end
end
