# frozen_string_literal: true

module Vobiz
  module Sms
    module Campaigns
      module Types
        class AddCampaignNumbersRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :body, -> { Vobiz::Sms::Types::CampaignNumbersRequest }, optional: false, nullable: false
        end
      end
    end
  end
end
