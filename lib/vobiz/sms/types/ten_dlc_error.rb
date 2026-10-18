# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Error returned when the US 10DLC registry declines or cannot process a request. `error` is a human-readable
      # message you can show or log. When the registry answers with `400`, `404`, `409`, `422` or `429`, the same status
      # is passed through with this body; `502` means the registry did not answer and `503` means it did not accept
      # Vobiz's service credentials.
      class TenDlcError < Internal::Types::Model
        field :error, -> { String }, optional: false, nullable: false

        field :provider_error, -> { String }, optional: true, nullable: false, api_name: "providerError"
      end
    end
  end
end
