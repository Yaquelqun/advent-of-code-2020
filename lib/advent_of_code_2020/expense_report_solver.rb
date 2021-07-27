# frozen_string_literal: true

require_relative 'expense_report'

module AdventOfCode2020
  # Solver for day 1. Reads from an input file and find number matching up to 2020
  class ExpenseReportSolver
    def solve
      puts expense_report.find_matching_couple.reduce(&:*)
    end

    private

    def expense_report
      @expense_report ||= ExpenseReport.new
    end
  end
end
