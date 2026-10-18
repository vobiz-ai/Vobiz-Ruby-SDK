# frozen_string_literal: true

module Vobiz
  module Sms
    module Campaigns
      module Types
        class DeregisterCampaignRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
