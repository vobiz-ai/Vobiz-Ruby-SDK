# frozen_string_literal: true

module Vobiz
  module Sms
    module Coverage
      module Types
        class GetCoverageRequest < Internal::Types::Model
          field :country, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
