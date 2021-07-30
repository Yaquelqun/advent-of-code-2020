# frozen_string_literal: true

require_relative "../../connectors/aoc_connector"

module Helpers
  module Passports
    # fetches the passport data from the AOC API
    class PassportFetcher
      def fetch
        @fetch ||= ::Connectors::AocConnector.new(endpoint: "day_4_input").parse_data
      end
    end
  end
end
