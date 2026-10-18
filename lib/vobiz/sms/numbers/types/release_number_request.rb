# frozen_string_literal: true

module Vobiz
  module Sms
    module Numbers
      module Types
        class ReleaseNumberRequest < Internal::Types::Model
          field :e164, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
