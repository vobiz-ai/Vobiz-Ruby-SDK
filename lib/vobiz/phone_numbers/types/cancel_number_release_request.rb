# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class CancelNumberReleaseRequest < Internal::Types::Model
        field :account_id, -> { String }, optional: false, nullable: false

        field :e164, -> { String }, optional: false, nullable: false
      end
    end
  end
end
