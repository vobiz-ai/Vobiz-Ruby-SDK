# frozen_string_literal: true

module Vobiz
  module SubAccountKycTestMode
    module Types
      module MockFinalizePendingKycRequestVerificationType
        extend Vobiz::Internal::Types::Enum

        PAN = "pan"
        AADHAAR = "aadhaar"
        GST = "gst"
        CIN = "cin"
      end
    end
  end
end
