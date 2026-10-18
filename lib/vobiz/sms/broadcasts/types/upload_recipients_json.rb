# frozen_string_literal: true

module Vobiz
  module Sms
    module Broadcasts
      module Types
        class UploadRecipientsJSON < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :numbers, -> { Internal::Types::Array[String] }, optional: false, nullable: false

          field :default_country, -> { Vobiz::Sms::Broadcasts::Types::UploadRecipientsJSONDefaultCountry }, optional: true, nullable: false, api_name: "defaultCountry"
        end
      end
    end
  end
end
