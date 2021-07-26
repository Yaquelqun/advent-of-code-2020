require_relative 'expense_report_solver'

module AdventOfCode2020
  class DaySolver
    def initialize(day)
      @day = day
    end

    def solve
      case day
      when 1
        ExpenseReportSolver.new.solve
      else
        puts 'Unsupported day'
      end
    end

    private

    attr_reader :day
  end
end
