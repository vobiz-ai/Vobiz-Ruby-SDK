# frozen_string_literal: true

module Vobiz
  module Cdr
    module Types
      class ListCdrsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :from_number, -> { String }, optional: true, nullable: false

        field :to_number, -> { String }, optional: true, nullable: false

        field :start_date, -> { String }, optional: true, nullable: false

        field :end_date, -> { String }, optional: true, nullable: false

        field :call_direction, -> { Vobiz::Cdr::Types::ListCdrsRequestCallDirection }, optional: true, nullable: false

        field :min_duration, -> { Integer }, optional: true, nullable: false

        field :sip_call_id, -> { String }, optional: true, nullable: false

        field :bridge_uuid, -> { String }, optional: true, nullable: false

        field :hangup_cause, -> { String }, optional: true, nullable: false

        field :hangup_disposition, -> { String }, optional: true, nullable: false

        field :context, -> { String }, optional: true, nullable: false

        field :campaign_id, -> { String }, optional: true, nullable: false

        field :search, -> { String }, optional: true, nullable: false

        field :page, -> { Integer }, optional: true, nullable: false

        field :per_page, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
