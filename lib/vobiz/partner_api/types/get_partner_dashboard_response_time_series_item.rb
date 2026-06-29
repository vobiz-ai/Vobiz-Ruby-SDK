# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class GetPartnerDashboardResponseTimeSeriesItem < Internal::Types::Model
        field :date, -> { String }, optional: false, nullable: false

        field :total_calls, -> { Integer }, optional: false, nullable: false

        field :answered_calls, -> { Integer }, optional: false, nullable: false

        field :total_minutes, -> { Integer }, optional: false, nullable: false

        field :total_cost, -> { String }, optional: false, nullable: false

        field :inbound, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseTimeSeriesItemInbound }, optional: false, nullable: false

        field :outbound, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseTimeSeriesItemOutbound }, optional: false, nullable: false
      end
    end
  end
end
