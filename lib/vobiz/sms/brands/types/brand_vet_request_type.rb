# frozen_string_literal: true

module Vobiz
  module Sms
    module Brands
      module Types
        module BrandVetRequestType
          extend Vobiz::Internal::Types::Enum

          STANDARD = "STANDARD"
          ENHANCED = "ENHANCED"
          POLITICAL = "POLITICAL"
        end
      end
    end
  end
end
