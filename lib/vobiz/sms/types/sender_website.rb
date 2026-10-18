# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # A website shown on an RCS sender's info page.
      class SenderWebsite < Internal::Types::Model
        field :url, -> { String }, optional: true, nullable: false

        field :label, -> { String }, optional: true, nullable: false
      end
    end
  end
end
