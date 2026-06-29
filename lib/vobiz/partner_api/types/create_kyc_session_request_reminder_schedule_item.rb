# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class CreateKycSessionRequestReminderScheduleItem < Internal::Types::Model
        field :trigger, -> { Vobiz::PartnerAPI::Types::CreateKycSessionRequestReminderScheduleItemTrigger }, optional: true, nullable: false

        field :value, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
