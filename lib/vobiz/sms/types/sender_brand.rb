# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The brand an RCS sender represents.
      class SenderBrand < Internal::Types::Model
        field :brand_name, -> { String }, optional: true, nullable: false, api_name: "brandName"
      end
    end
  end
end
