# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # Paging details for a list of brand vets.
      class BrandVetPaging < Internal::Types::Model
        field :page, -> { Integer }, optional: true, nullable: false

        field :size, -> { Integer }, optional: true, nullable: false

        field :total_pages, -> { Integer }, optional: true, nullable: false, api_name: "totalPages"

        field :total_results, -> { Integer }, optional: true, nullable: false, api_name: "totalResults"
      end
    end
  end
end
