
require_relative "../connectors/aoc_connector"
require_relative "../helpers/bag_content_list"
require_relative "../models/bag"

class BagContentParser
  def solve
    puts("part1: #{shiny_bag_containers_count}")
    puts("part2: #{shiny_bag_max_content_count}")
  end

  private

  def shiny_bag_containers_count
    bag_content_list.containers_count_for(color: 'shiny gold')
  end

  def shiny_bag_max_content_count
    bags.detect { |bag| bag.color == 'shiny gold' }
        .content_count(bags: bags) - 1
  end

  def bag_content_list
    @bag_content_list ||= BagContentList.new(bags)
  end

  def bags
    @bags ||= ::Connectors::AocConnector.new(endpoint: "day_7_input")
                              .parse_data
                              .map { |bag| Bag.new(bag) }
  end
end
