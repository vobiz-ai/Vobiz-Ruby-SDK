# frozen_string_literal: true

module Vobiz
  module Sms
    module RcsSenders
      module Types
        class CreateTemplateRequest < Internal::Types::Model
          field :sender_id, -> { String }, optional: false, nullable: false, api_name: "senderId"

          field :template_name, -> { String }, optional: false, nullable: false, api_name: "templateName"

          field :type, -> { String }, optional: false, nullable: false

          field :content, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
        end
      end
    end
  end
end
