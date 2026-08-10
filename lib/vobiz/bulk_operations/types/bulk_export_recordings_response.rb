# frozen_string_literal: true

module Vobiz
  module BulkOperations
    module Types
      class BulkExportRecordingsResponse < Internal::Types::Model
        field :api_id, -> { String }, optional: true, nullable: false

        field :status, -> { String }, optional: true, nullable: false
      end
    end
  end
end
