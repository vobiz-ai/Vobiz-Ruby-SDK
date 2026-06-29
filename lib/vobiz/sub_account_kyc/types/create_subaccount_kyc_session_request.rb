# frozen_string_literal: true

module Vobiz
  module SubAccountKyc
    module Types
      class CreateSubaccountKycSessionRequest < Internal::Types::Model
        field :sub_auth_id, -> { String }, optional: false, nullable: false

        field :account_auth_id, -> { String }, optional: false, nullable: false

        field :flow_type, -> { Vobiz::SubAccountKyc::Types::CreateSubaccountKycSessionRequestFlowType }, optional: false, nullable: false

        field :customer_email, -> { String }, optional: true, nullable: false

        field :redirect_url, -> { String }, optional: true, nullable: false

        field :webhook_url, -> { String }, optional: true, nullable: false

        field :expires_in_days, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
