# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListCustomerCdrsResponseSummary < Internal::Types::Model
        field :answer_rate, -> { Integer }, optional: false, nullable: false, api_name: "answerRate"

        field :answered_calls, -> { Integer }, optional: false, nullable: false, api_name: "answeredCalls"

        field :avg_call_duration, -> { String }, optional: false, nullable: false, api_name: "avgCallDuration"

        field :last_call_at, -> { String }, optional: false, nullable: false

        field :total_calls, -> { Integer }, optional: false, nullable: false, api_name: "totalCalls"

        field :total_billable_seconds, -> { Integer }, optional: false, nullable: false

        field :total_cost, -> { Integer }, optional: false, nullable: false

        field :total_duration_seconds, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
