# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A supporting document or MMS sample file uploaded for campaign registration.
      class Document < Internal::Types::Model
        field :id, -> { String }, optional: true, nullable: false

        field :account_id, -> { String }, optional: true, nullable: false, api_name: "accountId"

        field :provider, -> { String }, optional: true, nullable: false

        field :document_id, -> { String }, optional: true, nullable: false, api_name: "documentId"

        field :document_name, -> { String }, optional: true, nullable: false, api_name: "documentName"

        field :content_type, -> { String }, optional: true, nullable: false, api_name: "contentType"

        field :content_length, -> { Integer }, optional: true, nullable: false, api_name: "contentLength"

        field :created_at, -> { String }, optional: true, nullable: false, api_name: "createdAt"
      end
    end
  end
end
