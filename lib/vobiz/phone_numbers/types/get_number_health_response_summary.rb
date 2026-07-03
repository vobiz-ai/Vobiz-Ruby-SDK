# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class GetNumberHealthResponseSummary < Internal::Types::Model
        field :period_days, -> { Integer }, optional: true, nullable: false

        field :total_calls, -> { Integer }, optional: true, nullable: false

        field :answered_calls, -> { Integer }, optional: true, nullable: false

        field :answer_rate, -> { Integer }, optional: true, nullable: false

        field :total_minutes, -> { Integer }, optional: true, nullable: false

        field :avg_duration, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
