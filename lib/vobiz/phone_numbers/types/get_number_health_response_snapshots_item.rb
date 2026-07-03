# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class GetNumberHealthResponseSnapshotsItem < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :ts, -> { String }, optional: true, nullable: false

        field :total_calls, -> { Integer }, optional: true, nullable: false

        field :answered_calls, -> { Integer }, optional: true, nullable: false

        field :failed_calls, -> { Integer }, optional: true, nullable: false

        field :answer_rate, -> { Integer }, optional: true, nullable: false

        field :total_duration, -> { Integer }, optional: true, nullable: false

        field :avg_duration, -> { Integer }, optional: true, nullable: false

        field :total_minutes, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
