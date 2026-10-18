# frozen_string_literal: true

module Vobiz
  module Sms
    module Messages
      module Types
        class PreviewMessageCostRequest < Internal::Types::Model
          field :from, -> { String }, optional: false, nullable: false

          field :to, -> { String }, optional: false, nullable: false

          field :channel, -> { Vobiz::Sms::Messages::Types::PreviewMessageCostRequestChannel }, optional: true, nullable: false

          field :text, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
