# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class UnrentNumberResponse < Internal::Types::Model
        field :cancel_url, -> { String }, optional: false, nullable: false

        field :cooldown_ends_at, -> { String }, optional: false, nullable: false

        field :message, -> { String }, optional: false, nullable: false

        field :note, -> { String }, optional: true, nullable: false

        field :release_fee, -> { Integer }, optional: false, nullable: false

        field :status, -> { String }, optional: false, nullable: false
      end
    end
  end
end
