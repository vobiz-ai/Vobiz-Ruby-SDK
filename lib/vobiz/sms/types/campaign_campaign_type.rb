# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module CampaignCampaignType
        extend Vobiz::Internal::Types::Enum

        TEN_DIGIT_LONG_CODE = "TEN_DIGIT_LONG_CODE"
        TOLL_FREE_UNIFIED_NUMBER = "TOLL_FREE_UNIFIED_NUMBER"
        TOLL_FREE_NUMBER = "TOLL_FREE_NUMBER"
        SHORT_CODE = "SHORT_CODE"
        EXTERNAL_TEN_DIGIT_LONG_CODE = "EXTERNAL_TEN_DIGIT_LONG_CODE"
        DCA2TEN_DIGIT_LONG_CODE = "DCA2_TEN_DIGIT_LONG_CODE"
        TOLL_FREE_EXTERNALLY_VERIFIED = "TOLL_FREE_EXTERNALLY_VERIFIED"
        RCS_SENDER_LAUNCH = "RCS_SENDER_LAUNCH"
      end
    end
  end
end
