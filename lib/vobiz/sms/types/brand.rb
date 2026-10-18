# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A brand on your account: the business behind your 10DLC traffic and its state at the US 10DLC registry. Optional
      # fields are omitted when empty, and registry state is refreshed when you retrieve the brand.
      class Brand < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"

        field :name, -> { String }, optional: true, nullable: false

        field :legal_name, -> { String }, optional: true, nullable: false, api_name: "legalName"

        field :brand_type, -> { Vobiz::Sms::Types::BrandBrandType }, optional: true, nullable: false, api_name: "brandType"

        field :stage, -> { Vobiz::Sms::Types::BrandStage }, optional: true, nullable: false

        field :registration_status, -> { Vobiz::Sms::Types::BrandRegistrationStatus }, optional: true, nullable: false, api_name: "registrationStatus"

        field :brand_identity_status, -> { String }, optional: true, nullable: false, api_name: "brandIdentityStatus"

        field :rejection_reasons, -> { Internal::Types::Array[Vobiz::Sms::Types::BrandRejectionReason] }, optional: true, nullable: false, api_name: "rejectionReasons"

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

        field :stock_exchange, -> { String }, optional: true, nullable: false, api_name: "stockExchange"

        field :stock_symbol, -> { String }, optional: true, nullable: false, api_name: "stockSymbol"

        field :tax_exempt_status, -> { String }, optional: true, nullable: false, api_name: "taxExemptStatus"

        field :last_synced_at, -> { String }, optional: true, nullable: false, api_name: "lastSyncedAt"

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"

        field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"
      end
    end
  end
end
