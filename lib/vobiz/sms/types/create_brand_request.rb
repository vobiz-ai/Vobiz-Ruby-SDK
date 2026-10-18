# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The business that will send messages. `name` and `brandType` are required; every other value is passed to the US
      # 10DLC registry as given, so use the values the registry accepts (listed per field) and match your official
      # records.
      class CreateBrandRequest < Internal::Types::Model
        field :reference_id, -> { String }, optional: true, nullable: false, api_name: "referenceId"

        field :name, -> { String }, optional: false, nullable: false

        field :legal_name, -> { String }, optional: true, nullable: false, api_name: "legalName"

        field :brand_type, -> { Vobiz::Sms::Types::CreateBrandRequestBrandType }, optional: false, nullable: false, api_name: "brandType"

        field :website, -> { String }, optional: true, nullable: false

        field :support_email, -> { String }, optional: true, nullable: false, api_name: "supportEmail"

        field :support_phone, -> { String }, optional: true, nullable: false, api_name: "supportPhone"

        field :vertical, -> { String }, optional: true, nullable: false

        field :tax_id, -> { String }, optional: true, nullable: false, api_name: "taxId"

        field :tax_id_issuing_country, -> { String }, optional: true, nullable: false, api_name: "taxIdIssuingCountry"

        field :country_code, -> { String }, optional: true, nullable: false, api_name: "countryCode"

        field :address, -> { Vobiz::Sms::Types::BrandAddress }, optional: true, nullable: false

        field :alternate_business_id, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "alternateBusinessId"

        field :business_contact_first_name, -> { String }, optional: true, nullable: false, api_name: "businessContactFirstName"

        field :business_contact_last_name, -> { String }, optional: true, nullable: false, api_name: "businessContactLastName"

        field :business_contact_email, -> { String }, optional: true, nullable: false, api_name: "businessContactEmail"

        field :business_dba, -> { String }, optional: true, nullable: false, api_name: "businessDba"

        field :legal_entity_type, -> { String }, optional: true, nullable: false, api_name: "legalEntityType"

        field :business_registration_type, -> { String }, optional: true, nullable: false, api_name: "businessRegistrationType"

        field :tax_exempt_status, -> { String }, optional: true, nullable: false, api_name: "taxExemptStatus"

        field :stock_exchange, -> { String }, optional: true, nullable: false, api_name: "stockExchange"

        field :stock_symbol, -> { String }, optional: true, nullable: false, api_name: "stockSymbol"
      end
    end
  end
end
