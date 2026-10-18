# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Acknowledgement that the registry accepted a brand-authentication or 2FA resend request. The outcome arrives
      # later on the brand.
      class BrandAuthRequested < Internal::Types::Model
        field :status, -> { String }, optional: true, nullable: false
      end
    end
  end
end
