# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerCdrsRequest < Internal::Types::Model
        field :customer_auth_id, -> { String }, optional: false, nullable: false

        field :start_date, -> { String }, optional: true, nullable: false

        field :end_date, -> { String }, optional: true, nullable: false

        field :call_direction, -> { Vobiz::PartnerAPI::Types::ListCustomerCdrsRequestCallDirection }, optional: true, nullable: false

        field :status, -> { Vobiz::PartnerAPI::Types::ListCustomerCdrsRequestStatus }, optional: true, nullable: false

        field :min_duration, -> { Integer }, optional: true, nullable: false

        field :hangup_cause, -> { String }, optional: true, nullable: false

        field :per_page, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
