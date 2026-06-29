# frozen_string_literal: true

module Vobiz
  module Dtmf
    module Types
      class SendDtmfRequest < Internal::Types::Model
        field :auth_id, -> { String }, optional: false, nullable: false

        field :call_uuid, -> { String }, optional: false, nullable: false

        field :digits, -> { String }, optional: false, nullable: false

        field :leg, -> { Vobiz::Dtmf::Types::SendDtmfRequestLeg }, optional: true, nullable: false
      end
    end
  end
end
