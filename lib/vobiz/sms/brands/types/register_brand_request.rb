# frozen_string_literal: true

module Vobiz
  module Sms
    module Brands
      module Types
        class RegisterBrandRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
