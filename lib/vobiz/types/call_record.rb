# frozen_string_literal: true

module Vobiz
  module Types
    class CallRecord < Internal::Types::Model
      field :call_uuid, -> { String }, optional: true, nullable: false

      field :from_number, -> { String }, optional: true, nullable: false

      field :to_number, -> { String }, optional: true, nullable: false

      field :call_status, -> { Vobiz::Types::CallRecordCallStatus }, optional: true, nullable: false

      field :duration, -> { Integer }, optional: true, nullable: false

      field :bill_duration, -> { Integer }, optional: true, nullable: false

      field :billed_amount, -> { String }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
