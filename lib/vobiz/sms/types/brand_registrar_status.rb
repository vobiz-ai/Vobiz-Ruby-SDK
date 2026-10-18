# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The brand's state at one registrar, read live from the US 10DLC registry.
      class BrandRegistrarStatus < Internal::Types::Model
        field :registrar, -> { String }, optional: true, nullable: false

        field :state, -> { String }, optional: true, nullable: false

        field :brand_identity_status, -> { String }, optional: true, nullable: false, api_name: "brandIdentityStatus"

        field :brand_authentication_status, -> { String }, optional: true, nullable: false, api_name: "brandAuthenticationStatus"

        field :rejection_reason, -> { String }, optional: true, nullable: false, api_name: "rejectionReason"
      end
    end
  end
end
