# frozen_string_literal: true

require_relative "../connectors/aoc_connector"
require_relative "../helpers/group_answers/group_answer_aggregator"
require_relative "../models/group_answer"

# Solver class for day 6
class GroupAnswerParser
  def solve
    puts "part 1: #{total_positive_answer_sum}"
    puts "part 2: #{common_positive_answer_sum}"
  end

  private

  def total_positive_answer_sum
    total_positive_answers.map(&:count).reduce(:+)
  end

  def common_positive_answer_sum
    common_positive_answers.map(&:count).reduce(:+)
  end

  def parsed_input
    @parsed_input ||= ::Connectors::AocConnector.new(endpoint: "day_6_input")
                                                .parse_data
  end

  def group_answers
    @group_answers ||= ::GroupAnswers::GroupAnswerAggregator
                       .new(parsed_input)
                       .aggregate
                       .map { |group_positive_answers| GroupAnswer.new(group_positive_answers) }
  end

  def total_positive_answers
    group_answers.map(&:total_positive_answers)
  end

  def common_positive_answers
    group_answers.map(&:common_positive_answers)
  end
end
