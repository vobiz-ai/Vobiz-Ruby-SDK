# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Counts of the broadcast's stored recipients by state, recounted every time you read the broadcast.
      class BroadcastStats < Internal::Types::Model
        field :total, -> { Integer }, optional: true, nullable: false

        field :pending, -> { Integer }, optional: true, nullable: false

        field :sent, -> { Integer }, optional: true, nullable: false

        field :delivered, -> { Integer }, optional: true, nullable: false

        field :failed, -> { Integer }, optional: true, nullable: false

        field :opted_out, -> { Integer }, optional: true, nullable: false, api_name: "optedOut"

        field :skipped, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
