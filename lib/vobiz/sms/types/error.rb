# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The body of every error response: a flat object with one `error` string that explains what went wrong. Use the
      # HTTP status code to decide how to handle the error, and log `error` for diagnosis.
      class Error < Internal::Types::Model
        field :error, -> { String }, optional: false, nullable: false
      end
    end
  end
end
