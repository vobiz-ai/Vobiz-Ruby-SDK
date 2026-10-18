# frozen_string_literal: true

module Vobiz
  module Sms
    module Coverage
      module Types
        class ListCoverageRequest < Internal::Types::Model
          field :q, -> { String }, optional: true, nullable: false

          field :region, -> { String }, optional: true, nullable: false

          field :two_way, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "twoWay"

          field :registration_required, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "registrationRequired"
        end
      end
    end
  end
end
