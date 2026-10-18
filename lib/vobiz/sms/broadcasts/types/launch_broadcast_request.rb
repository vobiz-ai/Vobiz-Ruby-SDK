# frozen_string_literal: true

module Vobiz
  module Sms
    module Broadcasts
      module Types
        class LaunchBroadcastRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
