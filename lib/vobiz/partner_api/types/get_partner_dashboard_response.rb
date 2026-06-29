# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class GetPartnerDashboardResponse < Internal::Types::Model
        field :partner, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponsePartner }, optional: false, nullable: false

        field :period, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponsePeriod }, optional: false, nullable: false

        field :accounts, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseAccounts }, optional: false, nullable: false

        field :total_balance, -> { String }, optional: false, nullable: false

        field :currency, -> { String }, optional: false, nullable: false

        field :calls, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseCalls }, optional: false, nullable: false

        field :traffic, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseTraffic }, optional: false, nullable: false

        field :by_product, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseByProduct }, optional: false, nullable: false

        field :time_series, -> { Internal::Types::Array[Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseTimeSeriesItem] }, optional: false, nullable: false
      end
    end
  end
end
