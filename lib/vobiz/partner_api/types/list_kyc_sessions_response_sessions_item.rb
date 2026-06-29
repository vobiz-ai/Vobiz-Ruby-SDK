# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListKycSessionsResponseSessionsItem < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false

        field :account_auth_id, -> { String }, optional: false, nullable: false

        field :customer_email, -> { String }, optional: false, nullable: true

        field :kyc_type, -> { String }, optional: false, nullable: true

        field :status, -> { String }, optional: false, nullable: false

        field :expires_at, -> { String }, optional: false, nullable: false

        field :first_opened_at, -> { String }, optional: false, nullable: true

        field :completed_at, -> { String }, optional: false, nullable: true

        field :webhook_url, -> { String }, optional: false, nullable: true

        field :redirect_url, -> { String }, optional: false, nullable: true

        field :reminder_schedule, -> { Internal::Types::Array[Vobiz::PartnerAPI::Types::ListKycSessionsResponseSessionsItemReminderScheduleItem] }, optional: false, nullable: false

        field :metadata, -> { Vobiz::PartnerAPI::Types::ListKycSessionsResponseSessionsItemMetadata }, optional: false, nullable: false

        field :verified_data, -> { Vobiz::PartnerAPI::Types::ListKycSessionsResponseSessionsItemVerifiedData }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :updated_at, -> { String }, optional: false, nullable: false
      end
    end
  end
end
