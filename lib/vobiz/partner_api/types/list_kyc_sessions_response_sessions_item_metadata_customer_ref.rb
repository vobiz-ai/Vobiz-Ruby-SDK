# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListKycSessionsResponseSessionsItemMetadataCustomerRef < Internal::Types::Model
        field :plan, -> { String }, optional: false, nullable: false

        field :customer_ref, -> { String }, optional: false, nullable: false
      end
    end
  end
end
