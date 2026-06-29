# frozen_string_literal: true

module Vobiz
  module SubAccountKyc
    module Types
      class SubaccountDigilockerVerifyRequest < Internal::Types::Model
        field :sub_auth_id, -> { String }, optional: false, nullable: false

        field :access_request_id, -> { String }, optional: false, nullable: false

        field :linked_number, -> { String }, optional: true, nullable: false
      end
    end
  end
end
