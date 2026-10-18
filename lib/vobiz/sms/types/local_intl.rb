# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A coverage rule that can differ for local (in-country) and international senders. Each value is `true`, `false`,
      # or `null` when unknown.
      class LocalIntl < Internal::Types::Model
        field :local, -> { Internal::Types::Boolean }, optional: true, nullable: false

        field :international, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
