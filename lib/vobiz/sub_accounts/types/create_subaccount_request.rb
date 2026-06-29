# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class CreateSubaccountRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :email, -> { String }, optional: true, nullable: false

        field :password, -> { String }, optional: true, nullable: false

        field :kyc_mode, -> { Vobiz::SubAccounts::Types::CreateSubaccountRequestKycMode }, optional: true, nullable: false

        field :business_type, -> { Vobiz::SubAccounts::Types::CreateSubaccountRequestBusinessType }, optional: true, nullable: false

        field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
