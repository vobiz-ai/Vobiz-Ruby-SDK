# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListKycSessionsResponseSessionsItemVerifiedDataAadhaarDob < Internal::Types::Model
        field :pan_type, -> { String }, optional: true, nullable: false

        field :pan_number, -> { String }, optional: true, nullable: false

        field :pan_name_match, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :completed_steps, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :pan_registered_name, -> { String }, optional: true, nullable: false

        field :gender, -> { String }, optional: true, nullable: false

        field :address, -> { String }, optional: true, nullable: false

        field :aadhaar_dob, -> { String }, optional: true, nullable: false

        field :aadhaar_name, -> { String }, optional: true, nullable: false

        field :masked_aadhaar, -> { String }, optional: true, nullable: false

        field :pan_name, -> { String }, optional: true, nullable: false
      end
    end
  end
end
