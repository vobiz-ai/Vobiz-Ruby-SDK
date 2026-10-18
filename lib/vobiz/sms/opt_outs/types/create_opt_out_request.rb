# frozen_string_literal: true

module Vobiz
  module Sms
    module OptOuts
      module Types
        class CreateOptOutRequest < Internal::Types::Model
          field :phone_number, -> { String }, optional: false, nullable: false, api_name: "phoneNumber"

          field :channel, -> { String }, optional: true, nullable: false

          field :reason, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
