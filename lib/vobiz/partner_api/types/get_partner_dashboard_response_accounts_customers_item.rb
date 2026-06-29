# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class GetPartnerDashboardResponseAccountsCustomersItem < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :email, -> { String }, optional: false, nullable: false

        field :phone, -> { String }, optional: false, nullable: false

        field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false
      end
    end
  end
end
