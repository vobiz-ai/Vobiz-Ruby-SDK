# frozen_string_literal: true

module Vobiz
  module Sms
    module Webhooks
      module Types
        class GetWebhookRequest < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
