# frozen_string_literal: true

module Vobiz
  module Sms
    module Campaigns
      module Types
        module CreateCampaignRequestCampaignType
          extend Vobiz::Internal::Types::Enum

          TEN_DIGIT_LONG_CODE = "TEN_DIGIT_LONG_CODE"
          EXTERNAL_TEN_DIGIT_LONG_CODE = "EXTERNAL_TEN_DIGIT_LONG_CODE"
          DCA2TEN_DIGIT_LONG_CODE = "DCA2_TEN_DIGIT_LONG_CODE"
          SHORT_CODE = "SHORT_CODE"
          RCS_SENDER_LAUNCH = "RCS_SENDER_LAUNCH"
        end
      end
    end
  end
end
