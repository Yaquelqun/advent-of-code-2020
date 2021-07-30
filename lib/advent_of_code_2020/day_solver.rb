# frozen_string_literal: true

require_relative "solvers_dictionary"

module AdventOfCode2020
  # Strategy manager to handle the different solvers
  class DaySolver
    def initialize(day)
      @day = day
    end

    def solve
      SolversDictionary.new.send("solve_day_#{day}")
    end

    private

    attr_reader :day
  end
end
