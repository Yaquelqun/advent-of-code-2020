require_relative '../../connectors/aoc_connector'

module Helpers
  module Passports
    class PassportFetcher
      def fetch
        @fetch ||= ::Connectors::AocConnector.new(endpoint: "day_4_input").parse_data
      end
    end
  end
end
