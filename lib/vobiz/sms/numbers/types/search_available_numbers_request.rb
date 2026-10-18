# frozen_string_literal: true

module Vobiz
  module Sms
    module Numbers
      module Types
        class SearchAvailableNumbersRequest < Internal::Types::Model
          field :country, -> { String }, optional: false, nullable: false

          field :capabilities, -> { String }, optional: true, nullable: false

          field :area_code, -> { String }, optional: true, nullable: false, api_name: "areaCode"

          field :limit, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
