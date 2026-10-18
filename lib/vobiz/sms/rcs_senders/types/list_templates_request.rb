# frozen_string_literal: true

module Vobiz
  module Sms
    module RcsSenders
      module Types
        class ListTemplatesRequest < Internal::Types::Model
          field :sender_id, -> { String }, optional: false, nullable: false, api_name: "senderId"

          field :limit, -> { Integer }, optional: true, nullable: false

          field :offset, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
