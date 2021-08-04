class Bag
  def initialize(description)
    @description = description
  end

  def color
    @color ||= @description.split(' bags').first
  end

  def content
    @content ||= compute_content
  end

  private

  attr_reader :description

  def compute_content
    h = Hash.new(0)
    parse_content(description.split('contain ').last).each { |quantity, color| h[color] += quantity.to_i }
    h
  end

  def parse_content(content_descriptions)
    content_descriptions.split(/ (bags|bag)[.,]/)
                       .difference(%w[bag bags])
                       .map(&:strip)
                       .map { |content_description| content_description.match(/\A(\d+) (.+)\z/)&.captures || [ ] }
  end
end
