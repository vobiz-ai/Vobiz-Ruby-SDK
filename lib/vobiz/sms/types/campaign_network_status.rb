# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The campaign's status on one US carrier network, read live from the US 10DLC registry.
      class CampaignNetworkStatus < Internal::Types::Model
        field :network, -> { String }, optional: true, nullable: false

        field :state, -> { String }, optional: true, nullable: false

        field :message_class, -> { String }, optional: true, nullable: false, api_name: "messageClass"

        field :throughput, -> { Integer }, optional: true, nullable: false

        field :brand_tier, -> { String }, optional: true, nullable: false, api_name: "brandTier"
      end
    end
  end
end
