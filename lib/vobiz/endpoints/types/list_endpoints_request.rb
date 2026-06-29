# frozen_string_literal: true

module Vobiz
  module Endpoints
    module Types
      class ListEndpointsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :limit, -> { Integer }, optional: true, nullable: false

        field :offset, -> { Integer }, optional: true, nullable: false

        field :username_contains, -> { String }, optional: true, nullable: false, api_name: "username__contains"

        field :username_exact, -> { String }, optional: true, nullable: false, api_name: "username__exact"

        field :username_startswith, -> { String }, optional: true, nullable: false, api_name: "username__startswith"

        field :alias_contains, -> { String }, optional: true, nullable: false, api_name: "alias__contains"

        field :alias_exact, -> { String }, optional: true, nullable: false, api_name: "alias__exact"

        field :application_id_exact, -> { Integer }, optional: true, nullable: false, api_name: "application_id__exact"

        field :application_id_isnull, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "application_id__isnull"

        field :sub_account, -> { String }, optional: true, nullable: false
      end
    end
  end
end
