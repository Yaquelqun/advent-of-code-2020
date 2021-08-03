require_relative "../connectors/aoc_connector"
require_relative "../helpers/group_answers/group_answer_aggregator"
require_relative "../models/group_answer"

class GroupAnswerParser
  def solve
    puts "part 1: #{group_common_positive_answer_counts.reduce(&:+)}"
    # puts "part 2: #{}"
  end

  private

  def total_positive_answer_counts
    parsed_input = ::Connectors::AocConnector.new(endpoint: "day_6_input")
                                             .parse_data

    ::GroupAnswers::GroupAnswerAggregator.new(parsed_input)
                                         .aggregate
                                         .map { |group_positive_answers| GroupAnswer.new(group_positive_answers) }
                                         .map(&:total_positive_answers)
                                         .map(&:count)
  end
end
