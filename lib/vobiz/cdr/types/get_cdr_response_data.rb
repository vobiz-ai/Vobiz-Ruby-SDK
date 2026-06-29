# frozen_string_literal: true

module Vobiz
  module Cdr
    module Types
      class GetCdrResponseData < Internal::Types::Model
        field :account_id, -> { String }, optional: false, nullable: false

        field :answer_time, -> { String }, optional: false, nullable: false

        field :billsec, -> { Integer }, optional: false, nullable: false

        field :bridge_uuid, -> { String }, optional: false, nullable: false

        field :call_direction, -> { String }, optional: false, nullable: false

        field :caller_id_name, -> { String }, optional: false, nullable: false

        field :caller_id_number, -> { String }, optional: false, nullable: false

        field :campaign_id, -> { Object }, optional: false, nullable: true

        field :carrier_ip, -> { Object }, optional: false, nullable: true

        field :codec, -> { String }, optional: false, nullable: false

        field :context, -> { String }, optional: false, nullable: false

        field :cost, -> { Integer }, optional: false, nullable: false

        field :created_at, -> { String }, optional: false, nullable: false

        field :currency, -> { String }, optional: false, nullable: false

        field :customer_endpoint, -> { Object }, optional: false, nullable: true

        field :destination_number, -> { String }, optional: false, nullable: false

        field :duration, -> { Integer }, optional: false, nullable: false

        field :end_time, -> { String }, optional: false, nullable: false

        field :failure_code, -> { Object }, optional: false, nullable: true

        field :failure_reason, -> { Object }, optional: false, nullable: true

        field :hangup_cause, -> { String }, optional: false, nullable: false

        field :hangup_cause_code, -> { Integer }, optional: false, nullable: false

        field :hangup_cause_name, -> { String }, optional: false, nullable: false

        field :hangup_disposition, -> { String }, optional: false, nullable: false

        field :hangup_source, -> { String }, optional: false, nullable: false

        field :id, -> { Integer }, optional: false, nullable: false

        field :jitter, -> { Integer }, optional: false, nullable: false

        field :mos, -> { Integer }, optional: false, nullable: false

        field :network_addr, -> { String }, optional: false, nullable: false

        field :origination_region, -> { String }, optional: false, nullable: false

        field :packet_loss, -> { Integer }, optional: false, nullable: false

        field :progress_time, -> { String }, optional: false, nullable: false

        field :region, -> { String }, optional: false, nullable: false

        field :ring_time, -> { Integer }, optional: false, nullable: false

        field :sip_call_id, -> { String }, optional: false, nullable: false

        field :sip_user_agent, -> { String }, optional: false, nullable: false

        field :start_time, -> { String }, optional: false, nullable: false

        field :streaming_cost, -> { Integer }, optional: false, nullable: false

        field :terminated_to, -> { Object }, optional: false, nullable: true

        field :total_cost, -> { Integer }, optional: false, nullable: false

        field :trunk_id, -> { Object }, optional: false, nullable: true

        field :updated_at, -> { String }, optional: false, nullable: false

        field :uuid, -> { String }, optional: false, nullable: false
      end
    end
  end
end
