# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Sender registration requirements for a destination country. The text fields are free-form and may prefix values
      # with `LOCAL:` or `INTERNATIONAL:` when they differ by traffic type.
      class CoverageRegistration < Internal::Types::Model
        field :required, -> { Vobiz::Sms::Types::LocalIntl }, optional: true, nullable: false

        field :duration_days, -> { String }, optional: true, nullable: false, api_name: "durationDays"

        field :information_required, -> { String }, optional: true, nullable: false, api_name: "informationRequired"

        field :documents_required, -> { String }, optional: true, nullable: false, api_name: "documentsRequired"

        field :alphanumeric_extra_steps, -> { String }, optional: true, nullable: false, api_name: "alphanumericExtraSteps"
      end
    end
  end
end
