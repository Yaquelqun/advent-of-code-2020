module GroupAnswers
  class GroupAnswerAggregator
    def initialize(raw_group_answers)
      @raw_group_answers = raw_group_answers
    end

    def aggregate
      result = raw_group_answers.each_with_object([[]]) do |raw_group_answer, aggregated_group_answers|
        aggregated_group_answers << [] and next if raw_group_answer.empty?

        aggregated_group_answers[-1] += [raw_group_answer]
      end

      result
    end

    private

    attr_reader :raw_group_answers
  end
end
