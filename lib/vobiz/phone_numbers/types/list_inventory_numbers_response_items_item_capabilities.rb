# frozen_string_literal: true

module Vobiz
  module PhoneNumbers
    module Types
      class ListInventoryNumbersResponseItemsItemCapabilities < Internal::Types::Model
        field :voice, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :sms, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :mms, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :fax, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
