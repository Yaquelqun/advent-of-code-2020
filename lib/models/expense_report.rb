# frozen_string_literal: true

require_relative "../connectors/aoc_connector"

# A class that handles the parsing of the input file and provider helpers to navigate the report
class ExpenseReport
  attr_reader :report

  def initialize
    @report = ::Connectors::AocConnector.new(endpoint: "day_1_input").parse_data.map(&:to_i).sort.reverse
  end

  def first_index_under(target)
    report.each_with_index do |n, index|
      return index if n < target
    end
  end

  def sum_values_from_indexes(indexes)
    values_at_indexes(indexes).reduce(:+)
  end

  def values_at_indexes(indexes)
    indexes.map { |index| report[index] }
  end
end
