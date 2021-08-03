# frozen_string_literal: true

# represents a seat in the airplane
# manages the seat id computation and its coordinatees
class Seat
  def initialize(description)
    @row_description = description[..-4]
    @column_description = description[-3..]
  end

  def id
    row * 8 + column
  end

  private

  attr_reader :row_description, :column_description

  def row
    @row ||= row_description.gsub("B", "1").gsub("F", "0").to_i(2)
  end

  def column
    @column ||= column_description.gsub("R", "1").gsub("L", "0").to_i(2)
  end
end
