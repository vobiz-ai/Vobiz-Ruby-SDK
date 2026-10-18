# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Whether a phone number can receive RCS messages from your RCS sender.
      class RcsReachability < Internal::Types::Model
        field :to, -> { String }, optional: true, nullable: false

        field :reachable, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :carrier, -> { String }, optional: true, nullable: false

        field :capability, -> { String }, optional: true, nullable: false
      end
    end
  end
end
