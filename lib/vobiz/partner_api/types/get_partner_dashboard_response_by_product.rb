# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class GetPartnerDashboardResponseByProduct < Internal::Types::Model
        field :sip_trunking, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseByProductSipTrunking }, optional: false, nullable: false

        field :voice_api, -> { Vobiz::PartnerAPI::Types::GetPartnerDashboardResponseByProductVoiceAPI }, optional: false, nullable: false
      end
    end
  end
end
