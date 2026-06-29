# frozen_string_literal: true

module Vobiz
  module Recordings
    module Types
      class ListRecordingsResponseObjectsItem < Internal::Types::Model
        field :add_time, -> { String }, optional: false, nullable: false

        field :call_uuid, -> { String }, optional: false, nullable: false

        field :conference_name, -> { String }, optional: false, nullable: true

        field :from_number, -> { String }, optional: false, nullable: false

        field :monthly_recording_storage_amount, -> { Integer }, optional: false, nullable: false

        field :recording_duration_ms, -> { String }, optional: false, nullable: false

        field :recording_end_ms, -> { String }, optional: false, nullable: true

        field :recording_format, -> { String }, optional: false, nullable: false

        field :recording_id, -> { String }, optional: false, nullable: false

        field :recording_start_ms, -> { String }, optional: false, nullable: true

        field :recording_storage_duration, -> { Integer }, optional: false, nullable: false

        field :recording_storage_rate, -> { Integer }, optional: false, nullable: false

        field :recording_type, -> { String }, optional: false, nullable: false

        field :recording_url, -> { String }, optional: false, nullable: false

        field :resource_uri, -> { String }, optional: false, nullable: false

        field :rounded_recording_duration, -> { Integer }, optional: false, nullable: false

        field :to_number, -> { String }, optional: false, nullable: false
      end
    end
  end
end
