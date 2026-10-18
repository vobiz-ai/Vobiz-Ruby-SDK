# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A recipient file upload. Every column other than the phone column becomes a template variable named after its
      # header.
      class UploadRecipientsFile < Internal::Types::Model
        field :file, -> { String }, optional: false, nullable: false

        field :default_country, -> { Vobiz::Sms::Types::UploadRecipientsFileDefaultCountry }, optional: true, nullable: false, api_name: "defaultCountry"
      end
    end
  end
end
