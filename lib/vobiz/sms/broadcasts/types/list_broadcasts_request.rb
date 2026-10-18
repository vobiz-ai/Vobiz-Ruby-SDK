# frozen_string_literal: true

module Vobiz
  module Sms
    module Broadcasts
      module Types
        class ListBroadcastsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false

          field :offset, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
