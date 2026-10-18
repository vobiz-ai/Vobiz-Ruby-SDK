# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Numbers the US 10DLC registry associates with a campaign.
      class CampaignNumberList < Internal::Types::Model
        field :number_previews, -> { Internal::Types::Array[Vobiz::Sms::Types::CampaignNumberPreview] }, optional: true, nullable: false, api_name: "numberPreviews"
      end
    end
  end
end
