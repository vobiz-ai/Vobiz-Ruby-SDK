# frozen_string_literal: true

module Vobiz
  module Trunks
    module Types
      module UpdateTrunkRequestTransport
        extend Vobiz::Internal::Types::Enum

        UDP = "udp"
        TCP = "tcp"
        TLS = "tls"
      end
    end
  end
end
