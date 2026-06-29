# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListKycSessionsRequest < Internal::Types::Model
        field :status, -> { Vobiz::PartnerAPI::Types::ListKycSessionsRequestStatus }, optional: true, nullable: false

        field :account_auth_id, -> { String }, optional: true, nullable: false

        field :page, -> { Integer }, optional: true, nullable: false

        field :size, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
