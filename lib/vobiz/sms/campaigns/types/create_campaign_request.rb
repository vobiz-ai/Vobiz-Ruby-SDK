# frozen_string_literal: true

module Vobiz
  module Sms
    module Campaigns
      module Types
        class CreateCampaignRequest < Internal::Types::Model
          field :reference_id, -> { String }, optional: true, nullable: false, api_name: "referenceId"

          field :brand_id, -> { String }, optional: false, nullable: false, api_name: "brandId"

          field :campaign_type, -> { Vobiz::Sms::Campaigns::Types::CreateCampaignRequestCampaignType }, optional: true, nullable: false, api_name: "campaignType"

          field :name, -> { String }, optional: true, nullable: false

          field :program_summary, -> { String }, optional: true, nullable: false, api_name: "programSummary"

          field :confirmation_message, -> { String }, optional: true, nullable: false, api_name: "confirmationMessage"

          field :help_message, -> { String }, optional: true, nullable: false, api_name: "helpMessage"

          field :stop_message, -> { String }, optional: true, nullable: false, api_name: "stopMessage"

          field :customer_care_phone, -> { String }, optional: true, nullable: false, api_name: "customerCarePhone"

          field :customer_care_email, -> { String }, optional: true, nullable: false, api_name: "customerCareEmail"

          field :terms_and_conditions_url, -> { String }, optional: true, nullable: false, api_name: "termsAndConditionsUrl"

          field :privacy_policy_url, -> { String }, optional: true, nullable: false, api_name: "privacyPolicyUrl"

          field :example_messages, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "exampleMessages"

          field :use_cases, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "useCases"

          field :message_types, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "messageTypes"

          field :opt_ins, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "optIns"

          field :low_volume, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "lowVolume"

          field :age_gated, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "ageGated"

          field :direct_lending, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "directLending"

          field :embedded_link, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "embeddedLink"

          field :embedded_phone, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "embeddedPhone"

          field :numbers, -> { Internal::Types::Array[String] }, optional: true, nullable: false

          field :supporting_documents, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "supportingDocuments"

          field :mms_sample_files, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "mmsSampleFiles"
        end
      end
    end
  end
end
