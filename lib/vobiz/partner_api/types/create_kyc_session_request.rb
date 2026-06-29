# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class CreateKycSessionRequest < Internal::Types::Model
        field :account_auth_id, -> { String }, optional: false, nullable: false

        field :flow_type, -> { Vobiz::PartnerAPI::Types::CreateKycSessionRequestFlowType }, optional: true, nullable: false

        field :customer_email, -> { String }, optional: true, nullable: false

        field :redirect_url, -> { String }, optional: true, nullable: false

        field :webhook_url, -> { String }, optional: true, nullable: false

        field :expires_in_days, -> { Integer }, optional: true, nullable: false

        field :reminder_schedule, -> { Internal::Types::Array[Vobiz::PartnerAPI::Types::CreateKycSessionRequestReminderScheduleItem] }, optional: true, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      end
    end
  end
end
