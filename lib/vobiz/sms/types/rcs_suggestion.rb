# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One suggestion button on an RCS message: a suggested reply or an action the recipient can tap. Which optional
      # fields apply depends on `type`.
      class RcsSuggestion < Internal::Types::Model
        field :type, -> { Vobiz::Sms::Types::RcsSuggestionType }, optional: false, nullable: false

        field :text, -> { String }, optional: false, nullable: false

        field :postback_data, -> { String }, optional: true, nullable: false, api_name: "postbackData"

        field :url, -> { String }, optional: true, nullable: false

        field :phone_number, -> { String }, optional: true, nullable: false, api_name: "phoneNumber"

        field :latitude, -> { Integer }, optional: true, nullable: false

        field :longitude, -> { Integer }, optional: true, nullable: false

        field :label, -> { String }, optional: true, nullable: false
      end
    end
  end
end
