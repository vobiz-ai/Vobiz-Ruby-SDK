# frozen_string_literal: true

module Vobiz
  module Types
    class Trunk < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false

      field :name, -> { String }, optional: true, nullable: false

      field :trunk_type, -> { Vobiz::Types::TrunkTrunkType }, optional: true, nullable: false

      field :sip_domain, -> { String }, optional: true, nullable: false

      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
