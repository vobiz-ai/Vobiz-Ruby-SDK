# frozen_string_literal: true

module Vobiz
  module Types
    class PartnerAnalyticsByDirectionInbound < Internal::Types::Model
      field :calls, -> { Integer }, optional: true, nullable: false

      field :cost, -> { Integer }, optional: true, nullable: false
    end
  end
end
