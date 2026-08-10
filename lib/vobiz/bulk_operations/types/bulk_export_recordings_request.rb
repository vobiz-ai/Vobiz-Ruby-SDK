# frozen_string_literal: true

module Vobiz
  module BulkOperations
    module Types
      class BulkExportRecordingsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :recipient, -> { Vobiz::BulkOperations::Types::BulkExportRecordingsRequestRecipient }, optional: false, nullable: false

        field :from, -> { String }, optional: true, nullable: false

        field :to, -> { String }, optional: true, nullable: false

        field :recording_storage_duration, -> { String }, optional: true, nullable: false

        field :recording_storage_duration_gte, -> { String }, optional: true, nullable: false, api_name: "recording_storage_duration__gte"

        field :recording_storage_duration_gt, -> { String }, optional: true, nullable: false, api_name: "recording_storage_duration__gt"

        field :recording_storage_duration_lte, -> { String }, optional: true, nullable: false, api_name: "recording_storage_duration__lte"

        field :recording_storage_duration_lt, -> { String }, optional: true, nullable: false, api_name: "recording_storage_duration__lt"

        field :from_number, -> { String }, optional: true, nullable: false

        field :to_number, -> { String }, optional: true, nullable: false

        field :call_uuid, -> { String }, optional: true, nullable: false

        field :conference_name, -> { String }, optional: true, nullable: false

        field :recording_format, -> { Vobiz::BulkOperations::Types::BulkExportRecordingsRequestRecordingFormat }, optional: true, nullable: false

        field :recording_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
