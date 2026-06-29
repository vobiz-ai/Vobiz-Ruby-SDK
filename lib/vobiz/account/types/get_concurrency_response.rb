# frozen_string_literal: true

module Vobiz
  module Account
    module Types
      class GetConcurrencyResponse < Internal::Types::Model
        field :account_id, -> { String }, optional: false, nullable: false

        field :concurrent_calls, -> { Integer }, optional: false, nullable: false

        field :max_concurrent, -> { Integer }, optional: false, nullable: false

        field :utilization_pct, -> { Integer }, optional: false, nullable: false

        field :request_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
