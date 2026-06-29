# frozen_string_literal: true

module Vobiz
  module Types
    module PartnerNumberStatus
      extend Vobiz::Internal::Types::Enum

      ACTIVE = "active"
      INACTIVE = "inactive"
      EXPIRED = "expired"
    end
  end
end
