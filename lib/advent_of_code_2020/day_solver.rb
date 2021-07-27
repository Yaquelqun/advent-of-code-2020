# frozen_string_literal: true

require_relative "expense_report_parser"

module AdventOfCode2020
  # Strategy manager to handle the different solvers
  class DaySolver
    def initialize(day)
      @day = day
    end

    def solve
      case day
      when 1
        ExpenseReportParser.new.solve
      else
        puts "Unsupported day"
      end
    end

    private

    attr_reader :day
  end
end
