# frozen_string_literal: true

module Vobiz
  module Sms
    module Brands
      module Types
        class UpdateBrandRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :body, -> { Vobiz::Sms::Types::CreateBrandRequest }, optional: false, nullable: false
        end
      end
    end
  end
end
