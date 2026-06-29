# frozen_string_literal: true

module Vobiz
  module Internal
    module Types
      module Unknown
        include Vobiz::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
