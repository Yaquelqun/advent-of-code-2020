
require_relative "../connectors/aoc_connector"
require_relative "../models/seat"

module AdventOfCode2020
  class PlaneSeatParser

    def solve
      puts "part1: #{max_seat_id}"
      # puts "part2: #{count_valid_passwords(strategy: "presence")}"
    end

    private

    def max_seat_id
      ::Connectors::AocConnector.new(endpoint: "day_5_input")
                                .parse_data
                                .map { |seat_description| Seat.new(seat_description) }
                                .reduce(0) { |max, seat| [max, seat.id].max }
    end
  end
end
