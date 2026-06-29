# frozen_string_literal: true

module Vobiz
  module Types
    class PartnerAnalyticsTotals < Internal::Types::Model
      field :total_calls, -> { Integer }, optional: true, nullable: false

      field :answered_calls, -> { Integer }, optional: true, nullable: false

      field :failed_calls, -> { Integer }, optional: true, nullable: false

      field :total_duration_seconds, -> { Integer }, optional: true, nullable: false

      field :total_cost, -> { Integer }, optional: true, nullable: false

      field :currency, -> { String }, optional: true, nullable: false
    end
  end
end
