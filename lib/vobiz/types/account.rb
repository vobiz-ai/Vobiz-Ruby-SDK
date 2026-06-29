# frozen_string_literal: true

module Vobiz
  module Types
    class Account < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :email, -> { String }, optional: true, nullable: false

      field :auth_id, -> { String }, optional: true, nullable: false

      field :account_type, -> { Vobiz::Types::AccountAccountType }, optional: true, nullable: false

      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :is_active, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :cps_limit, -> { Integer }, optional: true, nullable: false

      field :concurrent_calls_limit, -> { Integer }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
