# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class RevokeKycSessionRequest < Internal::Types::Model
        field :session_id, -> { String }, optional: false, nullable: false

        field :reason, -> { String }, optional: true, nullable: false
      end
    end
  end
end
