# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A 10DLC or toll-free campaign on your account and its state at the US 10DLC registry. Optional fields are
      # omitted when empty, and registry state is refreshed when you retrieve the campaign.
      class Campaign < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"

        field :brand_id, -> { String }, optional: true, nullable: false, api_name: "brandId"

        field :name, -> { String }, optional: true, nullable: false

        field :campaign_type, -> { Vobiz::Sms::Types::CampaignCampaignType }, optional: true, nullable: false, api_name: "campaignType"

        field :stage, -> { String }, optional: true, nullable: false

        field :program_summary, -> { String }, optional: true, nullable: false, api_name: "programSummary"

        field :confirmation_message, -> { String }, optional: true, nullable: false, api_name: "confirmationMessage"

        field :help_message, -> { String }, optional: true, nullable: false, api_name: "helpMessage"

        field :stop_message, -> { String }, optional: true, nullable: false, api_name: "stopMessage"

        field :customer_care_phone, -> { String }, optional: true, nullable: false, api_name: "customerCarePhone"

        field :customer_care_email, -> { String }, optional: true, nullable: false, api_name: "customerCareEmail"

        field :example_messages, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "exampleMessages"

        field :terms_and_conditions_url, -> { String }, optional: true, nullable: false, api_name: "termsAndConditionsUrl"

        field :privacy_policy_url, -> { String }, optional: true, nullable: false, api_name: "privacyPolicyUrl"

        field :use_cases, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "useCases"

        field :message_types, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "messageTypes"

        field :opt_ins, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "optIns"

        field :low_volume, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "lowVolume"

        field :age_gated, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "ageGated"

        field :direct_lending, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "directLending"

        field :embedded_link, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "embeddedLink"

        field :embedded_phone, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "embeddedPhone"

        field :numbers, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :rejection_reasons, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false, api_name: "rejectionReasons"

        field :last_synced_at, -> { String }, optional: true, nullable: false, api_name: "lastSyncedAt"

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"

        field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"
      end
    end
  end
end
