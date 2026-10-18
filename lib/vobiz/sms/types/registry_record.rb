# frozen_string_literal: true

module Vobiz
  module Sms
    module Types
      module RegistryRecord
        # RegistryRecord is an alias for Hash

        # @option str [String]
        #
        # @return [untyped]
        def self.load(str)
          ::JSON.parse(str)
        end

        # @option value [untyped]
        #
        # @return [String]
        def self.dump(value)
          ::JSON.generate(value)
        end
      end
    end
  end
end
