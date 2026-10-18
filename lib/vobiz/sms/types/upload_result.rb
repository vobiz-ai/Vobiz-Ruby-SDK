# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Summary of a recipient upload. The upload replaces the broadcast's previous recipient list.
      class UploadResult < Internal::Types::Model
        field :total, -> { Integer }, optional: true, nullable: false

        field :valid, -> { Integer }, optional: true, nullable: false

        field :invalid, -> { Internal::Types::Array[Vobiz::Sms::Types::InvalidRecipient] }, optional: true, nullable: false

        field :invalid_count, -> { Integer }, optional: true, nullable: false, api_name: "invalidCount"

        field :duplicates, -> { Integer }, optional: true, nullable: false

        field :opted_out, -> { Integer }, optional: true, nullable: false, api_name: "optedOut"

        field :columns, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      end
    end
  end
end
