# frozen_string_literal: true

module Vobiz
  module Types
    class SubAccount < Internal::Types::Model
      field :auth_id, -> { String }, optional: true, nullable: false

      field :auth_token, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :kyc_mode, -> { Vobiz::Types::SubAccountKycMode }, optional: true, nullable: false

      field :business_type, -> { String }, optional: true, nullable: false

      field :kyc_calls_blocked, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
