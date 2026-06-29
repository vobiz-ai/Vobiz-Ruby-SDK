# frozen_string_literal: true

module Vobiz
  module Types
    # Call detail record for a single voice session under a partner customer account.
    class PartnerCdr < Internal::Types::Model
      field :call_uuid, -> { String }, optional: true, nullable: false

      field :from_number, -> { String }, optional: true, nullable: false

      field :to_number, -> { String }, optional: true, nullable: false

      field :direction, -> { Vobiz::Types::PartnerCdrDirection }, optional: true, nullable: false

      field :status, -> { Vobiz::Types::PartnerCdrStatus }, optional: true, nullable: false

      field :duration_seconds, -> { Integer }, optional: true, nullable: false

      field :hangup_cause, -> { String }, optional: true, nullable: false

      field :cost, -> { Integer }, optional: true, nullable: false

      field :currency, -> { String }, optional: true, nullable: false

      field :start_time, -> { String }, optional: true, nullable: false

      field :answer_time, -> { String }, optional: true, nullable: false

      field :end_time, -> { String }, optional: true, nullable: false

      field :trunk_id, -> { String }, optional: true, nullable: false

      field :context, -> { String }, optional: true, nullable: false

      field :account_auth_id, -> { String }, optional: true, nullable: false
    end
  end
end
