# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The most relevant US registration campaign attached to a number. `null` when no campaign is attached.
      class SmsNumberTenDlc < Internal::Types::Model
        field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"

        field :campaign_name, -> { String }, optional: true, nullable: false, api_name: "campaignName"

        field :stage, -> { String }, optional: true, nullable: false
      end
    end
  end
end
