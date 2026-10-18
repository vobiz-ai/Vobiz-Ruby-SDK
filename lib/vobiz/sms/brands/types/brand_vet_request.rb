# frozen_string_literal: true

module Vobiz
  module Sms
    module Brands
      module Types
        class BrandVetRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :type, -> { Vobiz::Sms::Brands::Types::BrandVetRequestType }, optional: true, nullable: false
        end
      end
    end
  end
end
