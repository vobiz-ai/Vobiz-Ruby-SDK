# frozen_string_literal: true

module Vobiz
  module Sms
    module Campaigns
      module Types
        class CampaignRegisterRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :priority_id, -> { String }, optional: true, nullable: false, api_name: "priorityId"
        end
      end
    end
  end
end
