
require_relative "../connectors/aoc_connector"
require_relative "../helpers/bag_content_matrix"
require_relative "../models/bag"

class BagContentParser
  def solve
    puts("part1: #{shiny_bag_containers_count}")
    # puts("part2:")
  end

  private

  def shiny_bag_containers_count
    bag_content_matrix.containers_count_for(color: 'shiny gold')
  end

  def bag_content_matrix
    @bag_content_matrix ||= BagContentMatrix.new(bags)
  end

  def bags
    @bags ||= ::Connectors::AocConnector.new(endpoint: "day_7_input")
                              .parse_data
                              .map { |bag| Bag.new(bag) }
  end
end
