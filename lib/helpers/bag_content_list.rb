class BagContentList

  def initialize(bags)
    @bags = bags
  end

  def containers_count_for(color:)
    containers = parent_colors_for(color: color)
    new_children = containers

    until new_children.empty?
      new_parents = new_children.flat_map { |new_color| parent_colors_for(color: new_color) }
      new_children = new_parents - containers
      containers |= new_parents
    end

    containers.count
  end

  private

  attr_reader :bags

  def parent_colors_for(color:)
    bags.reject { |bag| bag.content[color].zero? }.map(&:color)
  end

  def contents_for(bag:)
    bags.select { |bag| bag.color == bag.color }
  end
end
