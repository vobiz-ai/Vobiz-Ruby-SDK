# frozen_string_literal: true

module Vobiz
  module Trunks
    module Types
      class CreateTrunkRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :name, -> { String }, optional: false, nullable: false

        field :trunk_type, -> { String }, optional: false, nullable: false

        field :max_concurrent_calls, -> { Integer }, optional: false, nullable: false

        field :webhook_url, -> { String }, optional: true, nullable: false

        field :webhook_method, -> { Vobiz::Trunks::Types::CreateTrunkRequestWebhookMethod }, optional: true, nullable: false
      end
    end
  end
end
