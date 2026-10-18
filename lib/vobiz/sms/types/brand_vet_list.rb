# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # One page of the brand's vetting records from the US 10DLC registry.
      class BrandVetList < Internal::Types::Model
        field :results, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false

        field :paging, -> { Vobiz::Sms::Types::BrandVetPaging }, optional: true, nullable: false
      end
    end
  end
end
