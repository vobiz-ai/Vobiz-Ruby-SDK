# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Postal address of the business. Keys are passed to the US 10DLC registry as given, so you can add any address
      # key the registry accepts.
      class BrandAddress < Internal::Types::Model
        field :street, -> { String }, optional: true, nullable: false

        field :city, -> { String }, optional: true, nullable: false

        field :state, -> { String }, optional: true, nullable: false

        field :zip_code, -> { String }, optional: true, nullable: false, api_name: "zipCode"
      end
    end
  end
end
