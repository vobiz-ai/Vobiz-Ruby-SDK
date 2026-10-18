# frozen_string_literal: true

module Vobiz
  module Sms
    module Broadcasts
      module Types
        class ListRecipientsRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :status, -> { Vobiz::Sms::Broadcasts::Types::ListRecipientsRequestStatus }, optional: true, nullable: false

          field :limit, -> { Integer }, optional: true, nullable: false

          field :offset, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
