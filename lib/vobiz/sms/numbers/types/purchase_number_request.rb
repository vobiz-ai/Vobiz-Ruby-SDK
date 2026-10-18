# frozen_string_literal: true

module Vobiz
  module Sms
    module Numbers
      module Types
        class PurchaseNumberRequest < Internal::Types::Model
          field :e164, -> { String }, optional: false, nullable: false

          field :country, -> { String }, optional: false, nullable: false

          field :number_key, -> { String }, optional: true, nullable: false, api_name: "numberKey"
        end
      end
    end
  end
end
