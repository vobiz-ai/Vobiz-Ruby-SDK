# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A contact email address shown on an RCS sender's info page.
      class SenderEmail < Internal::Types::Model
        field :address, -> { String }, optional: true, nullable: false

        field :label, -> { String }, optional: true, nullable: false
      end
    end
  end
end
