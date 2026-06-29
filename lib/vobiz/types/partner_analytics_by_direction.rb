# frozen_string_literal: true

module Vobiz
  module Types
    class PartnerAnalyticsByDirection < Internal::Types::Model
      field :inbound, -> { Vobiz::Types::PartnerAnalyticsByDirectionInbound }, optional: true, nullable: false

      field :outbound, -> { Vobiz::Types::PartnerAnalyticsByDirectionOutbound }, optional: true, nullable: false
    end
  end
end
