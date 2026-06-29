# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListKycSessionsResponseSessionsItemVerifiedData < Internal::Types::Model
        extend Vobiz::Internal::Types::Union

        member -> { Object }

        member -> { Vobiz::PartnerAPI::Types::ListKycSessionsResponseSessionsItemVerifiedDataAadhaarDob }
      end
    end
  end
end
