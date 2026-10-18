# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module OptOutSource
        extend Vobiz::Internal::Types::Enum

        INBOUND = "inbound"
        MANUAL = "manual"
      end
    end
  end
end
