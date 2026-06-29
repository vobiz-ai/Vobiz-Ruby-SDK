# frozen_string_literal: true

module Vobiz
  module Types
    class Balance < Internal::Types::Model
      field :auth_id, -> { String }, optional: true, nullable: false

      field :balance, -> { String }, optional: true, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :auto_recharge, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
