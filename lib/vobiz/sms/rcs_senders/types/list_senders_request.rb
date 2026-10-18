# frozen_string_literal: true

module Vobiz
  module Sms
    module RcsSenders
      module Types
        class ListSendersRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false

          field :offset, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
