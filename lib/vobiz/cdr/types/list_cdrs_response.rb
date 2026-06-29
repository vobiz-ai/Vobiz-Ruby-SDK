# frozen_string_literal: true

module Vobiz
  module Cdr
    module Types
      class ListCdrsResponse < Internal::Types::Model
        field :account_id, -> { String }, optional: false, nullable: false

        field :count, -> { Integer }, optional: false, nullable: false

        field :data, -> { Internal::Types::Array[Vobiz::Cdr::Types::ListCdrsResponseDataItem] }, optional: false, nullable: false

        field :pagination, -> { Vobiz::Cdr::Types::ListCdrsResponsePagination }, optional: false, nullable: false

        field :success, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :summary, -> { Vobiz::Cdr::Types::ListCdrsResponseSummary }, optional: false, nullable: false
      end
    end
  end
end
