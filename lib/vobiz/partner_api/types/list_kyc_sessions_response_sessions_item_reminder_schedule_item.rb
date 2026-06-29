# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ListKycSessionsResponseSessionsItemReminderScheduleItem < Internal::Types::Model
        field :value, -> { Integer }, optional: false, nullable: false

        field :trigger, -> { String }, optional: false, nullable: false
      end
    end
  end
end
