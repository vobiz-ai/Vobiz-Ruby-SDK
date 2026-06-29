# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class GetPartnerDashboardResponseCalls < Internal::Types::Model
        field :total_calls, -> { Integer }, optional: false, nullable: false

        field :answered_calls, -> { Integer }, optional: false, nullable: false

        field :total_minutes, -> { Integer }, optional: false, nullable: false

        field :total_cost, -> { String }, optional: false, nullable: false
      end
    end
  end
end
