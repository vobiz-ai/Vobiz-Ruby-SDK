# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The full coverage record for one destination country, returned by `GET /coverage/{country}`.
      class CoverageDetail < Internal::Types::Model
        field :country, -> { String }, optional: true, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :region, -> { String }, optional: true, nullable: false

        field :dial_code, -> { String }, optional: true, nullable: false, api_name: "dialCode"

        field :mcc, -> { String }, optional: true, nullable: false

        field :number_portability, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "numberPortability"

        field :local_vs_international_traffic, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "localVsInternationalTraffic"

        field :senders, -> { Vobiz::Sms::Types::CoverageSenders }, optional: true, nullable: false

        field :registration, -> { Vobiz::Sms::Types::CoverageRegistration }, optional: true, nullable: false

        field :urls, -> { Vobiz::Sms::Types::CoverageURLs }, optional: true, nullable: false

        field :opt_out_mandatory, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "optOutMandatory"

        field :two_way, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "twoWay"

        field :prohibited_topics, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "prohibitedTopics"

        field :prohibited_notes, -> { String }, optional: true, nullable: false, api_name: "prohibitedNotes"

        field :send_window, -> { Vobiz::Sms::Types::CoverageSendWindow }, optional: true, nullable: false, api_name: "sendWindow"

        field :market_notes, -> { String }, optional: true, nullable: false, api_name: "marketNotes"

        field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"
      end
    end
  end
end
