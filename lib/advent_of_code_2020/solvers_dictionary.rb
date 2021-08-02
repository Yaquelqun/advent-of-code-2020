# frozen_string_literal: true

require_relative "../solvers/expense_report_parser"
require_relative "../solvers/password_list_parser"
require_relative "../solvers/terrain_parser"
require_relative "../solvers/passport_parser"
require_relative "../solvers/plane_seat_parser"

module AdventOfCode2020
  # contains all solvers classes and define methods to access them
  class SolversDictionary
    SOLVER_CLASSES = {
      1 => ExpenseReportParser,
      2 => PasswordListParser,
      3 => TerrainParser,
      4 => PassportParser,
      5 => PlaneSeatParser
    }.freeze

    MAX_DAYS = SOLVER_CLASSES.count

    private_constant :SOLVER_CLASSES

    MAX_DAYS.times do |day|
      define_method("solve_day_#{day.next}") { SOLVER_CLASSES[day.next].new.solve }
    end

    def method_missing(*_)
      puts "Unsupported day"
    end

    def respond_to_missing?(method, *)
      method =~ /solve_day_(\d+)/ || super
    end
  end
end
