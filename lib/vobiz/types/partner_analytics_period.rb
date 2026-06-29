# frozen_string_literal: true

module Vobiz
  module Types
    class PartnerAnalyticsPeriod < Internal::Types::Model
      field :from, -> { String }, optional: true, nullable: false

      field :to, -> { String }, optional: true, nullable: false
    end
  end
end
