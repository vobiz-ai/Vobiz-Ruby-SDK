# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One page of a broadcast's recipients, in upload order, with the count that matches your filter.
      class BroadcastRecipientList < Internal::Types::Model
        field :recipients, -> { Internal::Types::Array[Vobiz::Sms::Types::BroadcastRecipient] }, optional: true, nullable: false

        field :total, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
