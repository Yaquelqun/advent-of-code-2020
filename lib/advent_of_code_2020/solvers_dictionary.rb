require_relative "expense_report_parser"
require_relative "password_list_parser"
require_relative "terrain_parser"
require_relative "passport_parser"

module AdventOfCode2020
  class SolversDictionary
    MAX_DAYS = 4

    SOLVER_CLASSES = {
      1 => ExpenseReportParser,
      2 => PasswordListParser,
      3 => TerrainParser,
      4 => PassportParser
    }.freeze

    private_constant :SOLVER_CLASSES

    MAX_DAYS.times do |day|
      define_method("solve_day_#{day.next}") { SOLVER_CLASSES[day.next].new.solve }
    end

    def method_missing(*args)
      puts "Unsupported day"
    end
  end
end
