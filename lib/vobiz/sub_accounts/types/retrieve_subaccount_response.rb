# frozen_string_literal: true

module Vobiz
  module SubAccounts
    module Types
      class RetrieveSubaccountResponse < Internal::Types::Model
        field :name, -> { String }, optional: false, nullable: false

        field :email, -> { Object }, optional: false, nullable: true

        field :phone, -> { Object }, optional: false, nullable: true

        field :description, -> { Object }, optional: false, nullable: true

        field :permissions, -> { Object }, optional: false, nullable: true

        field :rate_limit, -> { Integer }, optional: false, nullable: false

        field :id, -> { String }, optional: false, nullable: false

        field :parent_account_id, -> { String }, optional: false, nullable: false

        field :parent_auth_id, -> { String }, optional: false, nullable: false

        field :auth_id, -> { String }, optional: false, nullable: false

        field :auth_token, -> { String }, optional: false, nullable: false

        field :api_id, -> { String }, optional: false, nullable: false

        field :email_verified, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :created, -> { String }, optional: false, nullable: false

        field :modified, -> { String }, optional: false, nullable: false

        field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false

        field :last_used, -> { Object }, optional: false, nullable: true

        field :account, -> { String }, optional: false, nullable: false

        field :resource_uri, -> { String }, optional: false, nullable: false
      end
    end
  end
end
