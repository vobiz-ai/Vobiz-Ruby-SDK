# frozen_string_literal: true

module Vobiz
  module PartnerAPI
    module Types
      class ResendKycSessionRequest < Internal::Types::Model
        field :session_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
