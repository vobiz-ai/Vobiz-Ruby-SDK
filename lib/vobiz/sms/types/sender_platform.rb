# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Identifiers the RCS platform has assigned to your agent. Set them only when you already have them.
      class SenderPlatform < Internal::Types::Model
        field :application_id, -> { String }, optional: true, nullable: false, api_name: "applicationId"

        field :entity_id, -> { String }, optional: true, nullable: false, api_name: "entityId"
      end
    end
  end
end
