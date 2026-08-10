# frozen_string_literal: true

module Vobiz
  module BulkOperations
    module Types
      # Email delivery targets for the export archive.
      class BulkExportRecordingsRequestRecipient < Internal::Types::Model
        field :customer_account, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
