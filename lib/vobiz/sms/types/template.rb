# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A message template registered on an RCS sender, with the approval status reported by the RCS platform.
      class Template < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :sender_id, -> { String }, optional: true, nullable: false, api_name: "senderId"

        field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"

        field :provider, -> { String }, optional: true, nullable: false

        field :template_name, -> { String }, optional: true, nullable: false, api_name: "templateName"

        field :type, -> { String }, optional: true, nullable: false

        field :status, -> { String }, optional: true, nullable: false

        field :content, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"

        field :updated_at, -> { String }, optional: true, nullable: false, api_name: "updatedAt"
      end
    end
  end
end
