# frozen_string_literal: true

module Vobiz
  module Sms
    module Broadcasts
      module Types
        class PreviewBroadcastRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false

          field :limit, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
