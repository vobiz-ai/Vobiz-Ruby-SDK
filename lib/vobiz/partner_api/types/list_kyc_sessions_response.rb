# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListKycSessionsResponse < Internal::Types::Model
        field :sessions, -> { Internal::Types::Array[Vobiz::PartnerAPI::Types::ListKycSessionsResponseSessionsItem] }, optional: false, nullable: false

        field :total, -> { Integer }, optional: false, nullable: false

        field :page, -> { Integer }, optional: false, nullable: false

        field :size, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
