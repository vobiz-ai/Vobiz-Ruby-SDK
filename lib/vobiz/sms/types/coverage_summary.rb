# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One row of the coverage list, with the key rules for a destination country. Call `GET /coverage/{country}` for
      # the full record.
      class CoverageSummary < Internal::Types::Model
        field :country, -> { String }, optional: true, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :region, -> { String }, optional: true, nullable: false

        field :dial_code, -> { String }, optional: true, nullable: false, api_name: "dialCode"

        field :senders, -> { Vobiz::Sms::Types::CoverageSenders }, optional: true, nullable: false

        field :registration_required, -> { Vobiz::Sms::Types::LocalIntl }, optional: true, nullable: false, api_name: "registrationRequired"

        field :two_way, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "twoWay"

        field :opt_out_mandatory, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "optOutMandatory"

        field :has_send_window, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hasSendWindow"
      end
    end
  end
end
