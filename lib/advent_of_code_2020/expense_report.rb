require_relative "../connectors/aoc_connector"

module AdventOfCode2020
  class ExpenseReport

    def initialize
      @report = ::Connectors::AocConnector.new(endpoint: "day_1_input").parse_data.map(&:to_i)
    end

    def find_matching_couple
      report.each do |number|
        remaining = 2020 - number
        return [number, remaining] if report.include?(remaining)
      end
    end

    private

    attr_reader :report
  end
end
