# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      # The hours during which messages may be sent to the country. Each value is a text range with its timezone rule,
      # for example `MON - FRI: 10:00:00 - 21:00:00; Timezone from MSISDN`, which means the recipient's local time.
      class CoverageSendWindow < Internal::Types::Model
        field :weekday, -> { String }, optional: true, nullable: false

        field :saturday, -> { String }, optional: true, nullable: false

        field :sunday, -> { String }, optional: true, nullable: false
      end
    end
  end
end
