# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One rejection recorded by a registrar for the brand.
      class BrandRejectionReason < Internal::Types::Model
        field :registrar, -> { String }, optional: true, nullable: false

        field :state, -> { String }, optional: true, nullable: false

        field :rejection_reason, -> { String }, optional: true, nullable: false, api_name: "rejectionReason"
      end
    end
  end
end
