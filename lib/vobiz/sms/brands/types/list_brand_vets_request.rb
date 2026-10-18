# frozen_string_literal: true

module Vobiz
  module Sms
    module Brands
      module Types
        class ListBrandVetsRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :page, -> { Integer }, optional: true, nullable: false

          field :size, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
