# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class GetPartnerDashboardResponseAccounts < Internal::Types::Model
        field :total, -> { Integer }, optional: false, nullable: false

        field :active, -> { Integer }, optional: false, nullable: false

        field :customers, -> { Internal::Types::Array[Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseAccountsCustomersItem] }, optional: false, nullable: false
      end
    end
  end
end
