# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class CancelNumberReleaseResponse < Internal::Types::Model
        field :message, -> { String }, optional: false, nullable: false

        field :status, -> { Vobiz::PhoneNumbers::Types::CancelNumberReleaseResponseStatus }, optional: false, nullable: false

        field :refund_status, -> { Vobiz::PhoneNumbers::Types::CancelNumberReleaseResponseRefundStatus }, optional: false, nullable: false

        field :refund_error, -> { String }, optional: true, nullable: false
      end
    end
  end
end
