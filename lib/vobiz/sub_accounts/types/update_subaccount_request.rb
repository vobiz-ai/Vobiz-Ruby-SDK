# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class UpdateSubaccountRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :sub_auth_id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: true, nullable: false

        field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :kyc_mode, -> { Vobiz::SubAccounts::Types::UpdateSubaccountRequestKycMode }, optional: true, nullable: false
      end
    end
  end
end
