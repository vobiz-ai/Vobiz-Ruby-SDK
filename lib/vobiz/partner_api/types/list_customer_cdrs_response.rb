# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerCdrsResponse < Internal::Types::Model
        field :account_id, -> { String }, optional: false, nullable: false

        field :count, -> { Integer }, optional: false, nullable: false

        field :data, -> { Internal::Types::Array[Object] }, optional: false, nullable: false

        field :pagination, -> { Vobiz::PartnerAPI::Types::ListCustomerCdrsResponsePagination }, optional: false, nullable: false

        field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :summary, -> { Vobiz::PartnerAPI::Types::ListCustomerCdrsResponseSummary }, optional: false, nullable: false

        field :account_auth_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
