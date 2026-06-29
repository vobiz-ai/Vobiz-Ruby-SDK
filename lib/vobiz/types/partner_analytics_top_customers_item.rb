# frozen_string_literal: true

module Vobiz
  module Types
    class PartnerAnalyticsTopCustomersItem < Internal::Types::Model
      field :auth_id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :calls, -> { Integer }, optional: true, nullable: false

      field :cost, -> { Integer }, optional: true, nullable: false
    end
  end
end
