# frozen_string_literal: true

module Vobiz
  module Sms
    module OptOuts
      module Types
        class ListOptOutsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: false, nullable: false

          field :offset, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
