# frozen_string_literal: true

require_relative "../models/terrain"

module AdventOfCode2020
  # Solver for day 3
  class TerrainParser
    def initialize
      @terrain = Terrain.new
    end

    def solve
      puts "part 1: #{toboggan_tester(right: 3, down: 1)}"
      puts "part 1: #{toboggan_multiplier(specs: [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]])}"
    end

    private

    attr_reader :terrain

    def toboggan_tester(right:, down:)
      terrain
        .adapt_to_slope(right: right, down: down)
        .count_trees
    end

    def toboggan_multiplier(specs:)
      specs.map { |right, down| toboggan_tester(right: right, down: down) }.reduce(:*)
    end
  end
end
