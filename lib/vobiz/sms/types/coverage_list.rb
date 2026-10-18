# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Coverage summary rows for every country that matches your filters.
      class CoverageList < Internal::Types::Model
        field :countries, -> { Internal::Types::Array[Vobiz::Sms::Types::CoverageSummary] }, optional: true, nullable: false

        field :total, -> { Integer }, optional: true, nullable: false

        field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"
      end
    end
  end
end
