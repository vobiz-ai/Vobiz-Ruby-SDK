# frozen_string_literal: true

module Vobiz
  module Sms
    module Campaigns
      module Types
        class TollFreeCampaignRequest < Internal::Types::Model
          field :reference_id, -> { String }, optional: true, nullable: false, api_name: "referenceId"

          field :name, -> { String }, optional: false, nullable: false

          field :privacy_policy_url, -> { String }, optional: true, nullable: false, api_name: "privacyPolicyUrl"

          field :terms_and_conditions_url, -> { String }, optional: true, nullable: false, api_name: "termsAndConditionsUrl"

          field :message_volume, -> { String }, optional: true, nullable: false, api_name: "messageVolume"

          field :numbers, -> { Internal::Types::Array[String] }, optional: true, nullable: false

          field :number_keys, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "numberKeys"

          field :use_case, -> { String }, optional: true, nullable: false, api_name: "useCase"

          field :program_summary, -> { String }, optional: true, nullable: false, api_name: "programSummary"

          field :example_message, -> { String }, optional: true, nullable: false, api_name: "exampleMessage"

          field :opt_ins, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "optIns"

          field :opt_in_image_ur_ls, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "optInImageURLs"

          field :additional_information, -> { String }, optional: true, nullable: false, api_name: "additionalInformation"

          field :country_code, -> { String }, optional: true, nullable: false, api_name: "countryCode"

          field :address, -> { Vobiz::Sms::Types::BrandAddress }, optional: true, nullable: false

          field :support_phone, -> { String }, optional: true, nullable: false, api_name: "supportPhone"

          field :support_email, -> { String }, optional: true, nullable: false, api_name: "supportEmail"

          field :business_contact_first_name, -> { String }, optional: true, nullable: false, api_name: "businessContactFirstName"

          field :business_contact_last_name, -> { String }, optional: true, nullable: false, api_name: "businessContactLastName"

          field :legal_name, -> { String }, optional: true, nullable: false, api_name: "legalName"

          field :business_dba, -> { String }, optional: true, nullable: false, api_name: "businessDBA"

          field :business_name, -> { String }, optional: true, nullable: false, api_name: "businessName"

          field :business_website, -> { String }, optional: true, nullable: false, api_name: "businessWebsite"

          field :customer_care_email, -> { String }, optional: true, nullable: false, api_name: "customerCareEmail"

          field :tax_id, -> { String }, optional: true, nullable: false, api_name: "taxId"

          field :tax_id_issuing_country, -> { String }, optional: true, nullable: false, api_name: "taxIdIssuingCountry"

          field :legal_entity_type, -> { String }, optional: true, nullable: false, api_name: "legalEntityType"

          field :business_registration_type, -> { String }, optional: true, nullable: false, api_name: "businessRegistrationType"

          field :campaign_verify_token, -> { String }, optional: true, nullable: false, api_name: "campaignVerifyToken"

          field :priority_id, -> { String }, optional: true, nullable: false, api_name: "priorityId"
        end
      end
    end
  end
end
