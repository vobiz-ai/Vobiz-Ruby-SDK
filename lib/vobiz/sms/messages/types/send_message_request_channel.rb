# frozen_string_literal: true

module Vobiz
  module Sms
    module Messages
      module Types
        module SendMessageRequestChannel
          extend Vobiz::Internal::Types::Enum

          SMS = "sms"
          MMS = "mms"
          RCS = "rcs"
        end
      end
    end
  end
end
