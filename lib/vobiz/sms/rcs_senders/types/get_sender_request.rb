# frozen_string_literal: true

module Vobiz
  module Sms
    module RcsSenders
      module Types
        class GetSenderRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
