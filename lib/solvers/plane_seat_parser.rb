
require_relative "../connectors/aoc_connector"
require_relative "../models/seat"

module AdventOfCode2020
  class PlaneSeatParser

    def solve
      puts "part1: #{max_seat_id}"
      puts "part2: #{my_seat_id}"
    end

    private

    def max_seat_id
      sorted_seat_ids.last
    end

    def my_seat_id
      ids_range = (sorted_seat_ids.first..sorted_seat_ids.last)
      (ids_range.to_a - sorted_seat_ids).first 
    end

    def sorted_seat_ids
      @sorted_seat_ids ||= ::Connectors::AocConnector.new(endpoint: "day_5_input")
                                              .parse_data
                                              .map { |seat_description| Seat.new(seat_description) }
                                              .map(&:id)
                                              .sort

    end
  end
end
