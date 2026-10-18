# frozen_string_literal: true

module Vobiz
  module Sms
    module RcsSenders
      module Types
        class GetTemplateRequest < Internal::Types::Model
          field :sender_id, -> { String }, optional: false, nullable: false, api_name: "senderId"

          field :template_name, -> { String }, optional: false, nullable: false, api_name: "templateName"
        end
      end
    end
  end
end
