# frozen_string_literal: true

module Vobiz
  module Types
    # Pagination metadata returned in the `meta` object of the trunk, credential, IP ACL and origination URI list
    # endpoints.
    class TrunkListMeta < Internal::Types::Model
      field :limit, -> { Integer }, optional: false, nullable: false

      field :offset, -> { Integer }, optional: false, nullable: false

      field :total, -> { Integer }, optional: false, nullable: false
    end
  end
end
