# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The result of releasing a number.
      class ReleaseNumberResponse < Internal::Types::Model
        field :purchase, -> { Vobiz::Sms::Types::NumberPurchase }, optional: true, nullable: false
      end
    end
  end
end
