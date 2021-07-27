# frozen_string_literal: true

require_relative 'expense_report'
require_relative '../helpers/pointers_array'

module AdventOfCode2020
  # Solver for day 1. Reads from an input file and find number matching up to 2020
  class ExpenseReportParser
    def solve
      puts "part1: #{find_matching_numbers(target: 2020, amount: 2).reduce(&:*)}"
      puts "part2: #{find_matching_numbers(target: 2020, amount: 3).reduce(&:*)}"
    end

    private

    def find_matching_numbers(target:, amount:)
      first_index = expense_report.first_index_under(target)
      pointers = Helpers::PointersArray.new(first_number: first_index, length: amount, max_value: expense_report.report.length - 1)

      pointers.next_pointer while expense_report.sum_values_from_indexes(pointers.values) != target

      expense_report.values_at_indexes(pointers.values)
    end

    def expense_report
      @expense_report ||= ExpenseReport.new
    end
  end
end
