# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListKycSessionsResponseSessionsItemMetadata < Internal::Types::Model
        extend Vobiz::Internal::Types::Union

        member -> { Object }

        member -> { Vobiz::PartnerAPI::Types::ListKycSessionsResponseSessionsItemMetadataCustomerRef }
      end
    end
  end
end
