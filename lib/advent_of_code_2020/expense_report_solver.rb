require_relative '../connectors/aoc_connector'

module AdventOfCode2020
  class ExpenseReportSolver

    def solve
      puts find_matching_couple.reduce(&:*)
    end

    private

    def expense_report
      @expense_report ||= ::Connectors::AocConnector.new(endpoint: 'day_1_input').parse_data.map(&:to_i)
    end

    def find_matching_couple
      expense_report.each do |number|
        remaining = 2020 - number
        return [number, remaining] if expense_report.include?(remaining)
      end
    end
  end
end
