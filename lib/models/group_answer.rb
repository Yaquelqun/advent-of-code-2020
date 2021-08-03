# frozen_string_literal: true

require "byebug"

# Represents all answers of a group
class GroupAnswer
  def initialize(group_positive_answers)
    @group_positive_answers = group_positive_answers
  end

  def common_positive_answers
    group_positive_answers
      .first
      .split("")
      .select { |answer| group_contains?(answer) }
  end

  def total_positive_answers
    group_positive_answers
      .join("")
      .split("")
      .uniq
  end

  private

  attr_reader :group_positive_answers

  def group_contains?(answer)
    group_positive_answers.all? { |group_answer| group_answer.include?(answer) }
  end
end
