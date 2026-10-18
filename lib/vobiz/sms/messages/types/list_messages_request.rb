# frozen_string_literal: true

module Vobiz
  module Sms
    module Messages
      module Types
        class ListMessagesRequest < Internal::Types::Model
          field :status, -> { Vobiz::Sms::Messages::Types::ListMessagesRequestStatus }, optional: true, nullable: false

          field :channel, -> { Vobiz::Sms::Messages::Types::ListMessagesRequestChannel }, optional: true, nullable: false

          field :direction, -> { Vobiz::Sms::Messages::Types::ListMessagesRequestDirection }, optional: true, nullable: false

          field :to, -> { String }, optional: true, nullable: false

          field :from, -> { String }, optional: true, nullable: false

          field :tag, -> { String }, optional: true, nullable: false

          field :start_date, -> { String }, optional: true, nullable: false, api_name: "startDate"

          field :end_date, -> { String }, optional: true, nullable: false, api_name: "endDate"

          field :limit, -> { Integer }, optional: true, nullable: false

          field :offset, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
