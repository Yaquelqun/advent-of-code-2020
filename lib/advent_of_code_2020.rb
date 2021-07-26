# frozen_string_literal: true
require_relative 'advent_of_code_2020/day_solver'

module AdventOfCode2020
  class Error < StandardError; end
  
  def self.run
    puts 'Advent of Code 2020'
    puts 'what day do you want the solution to ?'
    DaySolver.new(gets.chomp.to_i).solve
  end
end
