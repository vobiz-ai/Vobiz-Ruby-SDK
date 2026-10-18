# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # US A2P registration state of a number: which registration path applies and how far it has progressed.
      class SmsNumberRegistration < Internal::Types::Model
        field :kind, -> { Vobiz::Sms::Types::SmsNumberRegistrationKind }, optional: true, nullable: false

        field :status, -> { Vobiz::Sms::Types::SmsNumberRegistrationStatus }, optional: true, nullable: false

        field :campaign_id, -> { String }, optional: true, nullable: false, api_name: "campaignId"

        field :campaign_name, -> { String }, optional: true, nullable: false, api_name: "campaignName"

        field :stage, -> { String }, optional: true, nullable: false
      end
    end
  end
end
