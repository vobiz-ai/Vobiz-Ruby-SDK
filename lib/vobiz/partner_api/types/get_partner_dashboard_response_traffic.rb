# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class GetPartnerDashboardResponseTraffic < Internal::Types::Model
        field :inbound, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseTrafficInbound }, optional: false, nullable: false

        field :outbound, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseTrafficOutbound }, optional: false, nullable: false
      end
    end
  end
end
