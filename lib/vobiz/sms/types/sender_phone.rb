# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A contact phone number shown on an RCS sender's info page.
      class SenderPhone < Internal::Types::Model
        field :phone_number, -> { String }, optional: true, nullable: false, api_name: "phoneNumber"

        field :label, -> { String }, optional: true, nullable: false
      end
    end
  end
end
