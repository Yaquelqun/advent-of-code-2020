# frozen_string_literal: true

module AdventOfCode2020
  # class here to contain the terrain data and modification methods
  class Terrain
    def initialize
      @map = ::Connectors::AocConnector.new(endpoint: "day_3_input").parse_data
      @map_height = @map.length
      @map_width = @map[0].length
    end

    def adapt_to_slope(right:, down:)
      @adapted_map = []
      shift_counter = 0
      height_counter = 0

      while height_counter < map_height
        @adapted_map << shifted_line(height_counter, shift_counter)

        shift_counter += right
        height_counter += down
      end

      self
    end

    def count_trees
      adapted_map.map { |line| line[0] }.join("").count("#")
    end

    private

    attr_reader :map, :map_height, :adapted_map, :map_width

    def shifted_line(height_counter, shift_counter)
      shift = shift_counter % map_width
      map[height_counter][shift..] + map[height_counter][0..shift]
    end
  end
end
