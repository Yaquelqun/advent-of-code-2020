# frozen_string_literal: true

# contains logic related to one bag
class Bag
  def initialize(description)
    @description = description
  end

  def color
    @color ||= @description.split(" bags").first
  end

  def content
    @content ||= compute_content
  end

  def content_count(bags:)
    @content_count ||= compute_content_count(bags)
  end

  def empty?
    content == { nil => 0 }
  end

  private

  attr_reader :description

  def compute_content
    h = Hash.new(0)
    parse_content(description.split("contain ").last)&.each { |quantity, color| h[color] += quantity.to_i }
    h
  end

  def parse_content(content_descriptions)
    content_descriptions.split(/ (bags|bag)[.,]/)
                        .difference(%w[bag bags])
                        .map(&:strip)
                        .map { |content_description| content_description.match(/\A(\d+) (.+)\z/)&.captures }
  end

  def compute_content_count(bags)
    return 1 if empty?

    bags.reject { |bag| content[bag.color].zero? }
        .reduce(1) { |count, inside_bag| count + content[inside_bag.color] * inside_bag.content_count(bags: bags) }
  end
end
