# frozen_string_literal: true

module Vobiz
  module Cdr
    module Types
      class ExportCdrsRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :from_number, -> { String }, optional: true, nullable: false

        field :to_number, -> { String }, optional: true, nullable: false

        field :start_date, -> { String }, optional: true, nullable: false

        field :end_date, -> { String }, optional: true, nullable: false

        field :call_direction, -> { Vobiz::Cdr::Types::ExportCdrsRequestCallDirection }, optional: true, nullable: false

        field :min_duration, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
