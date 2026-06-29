# frozen_string_literal: true

module Vobiz
  module Cdr
    module Types
      class ListRecentCdrsResponse < Internal::Types::Model
        field :account_id, -> { String }, optional: false, nullable: false

        field :count, -> { Integer }, optional: false, nullable: false

        field :data, -> { Internal::Types::Array[Vobiz::Cdr::Types::ListRecentCdrsResponseDataItem] }, optional: false, nullable: false

        field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
