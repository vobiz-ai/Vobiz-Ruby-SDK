# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class GetNumberHealthResponse < Internal::Types::Model
        field :e164, -> { String }, optional: true, nullable: false

        field :status, -> { String }, optional: true, nullable: false

        field :usage_status, -> { String }, optional: true, nullable: false

        field :is_spam, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :granularity, -> { String }, optional: true, nullable: false

        field :summary, -> { Vobiz::PhoneNumbers::Types::GetNumberHealthResponseSummary }, optional: true, nullable: false

        field :snapshots, -> { Internal::Types::Array[Vobiz::PhoneNumbers::Types::GetNumberHealthResponseSnapshotsItem] }, optional: true, nullable: false
      end
    end
  end
end
