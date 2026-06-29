# frozen_string_literal: true

module Vobiz
  module Dtmf
    module Types
      module SendDtmfRequestLeg
        extend Vobiz::Internal::Types::Enum

        ALEG = "aleg"
        BLEG = "bleg"
        BOTH = "both"
      end
    end
  end
end
