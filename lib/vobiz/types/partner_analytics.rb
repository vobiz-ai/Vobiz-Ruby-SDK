# frozen_string_literal: true

module Vobiz
  module Types
    # Aggregated call analytics across all customer accounts for a date range.
    class PartnerAnalytics < Internal::Types::Model
      field :period, -> { Vobiz::Types::PartnerAnalyticsPeriod }, optional: true, nullable: false

      field :totals, -> { Vobiz::Types::PartnerAnalyticsTotals }, optional: true, nullable: false

      field :by_direction, -> { Vobiz::Types::PartnerAnalyticsByDirection }, optional: true, nullable: false

      field :top_customers, -> { Internal::Types::Array[Vobiz::Types::PartnerAnalyticsTopCustomersItem] }, optional: true, nullable: false
    end
  end
end
