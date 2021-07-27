# frozen_string_literal: true

require_relative "../connectors/aoc_connector"

module AdventOfCode2020
  # A class that handles the parsing of the input file and find the matching numbers
  class ExpenseReport
    attr_reader :report

    def initialize
      @report = ::Connectors::AocConnector.new(endpoint: "day_1_input").parse_data.map(&:to_i)
    end

    def first_index_under(target)
      report.each_with_index do |n, index|
        return index if n < target
      end
    end

    def sum_values_from_indexes(indexes)
      # puts indexes.inspect
      values_at_indexes(indexes).reduce(:+)
    end

    def values_at_indexes(indexes)
      indexes.map { |index| report[index] }
    end
  end
end
