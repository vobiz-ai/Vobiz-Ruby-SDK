# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class GetPartnerDashboardResponsePeriod < Internal::Types::Model
        field :from, -> { String }, optional: false, nullable: false

        field :to, -> { String }, optional: false, nullable: false
      end
    end
  end
end
