# frozen_string_literal: true

module Vobiz
  module SubAccountKyc
    module Types
      class SubaccountDigilockerInitiateRequest < Internal::Types::Model
        field :sub_auth_id, -> { String }, optional: false, nullable: false

        field :redirect_url, -> { String }, optional: false, nullable: false

        field :oauth_state, -> { String }, optional: true, nullable: false
      end
    end
  end
end
