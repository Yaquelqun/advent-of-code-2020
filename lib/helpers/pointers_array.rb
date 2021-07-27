module Helpers
  class PointersArray
    attr_reader :values, :max_value

    def initialize(length:, first_number:, max_value:)
      @values = (first_number..first_number + length - 1).to_a
      @max_value = max_value
    end

    def next_pointer
      increment_value(values.length - 1)
      values
    end

    private

    def increment_value(index)
      values[index] += 1
      return if values[index] < max_value

      increment_value(index - 1)
      values[index] = values[index - 1] + 1
    end
  end
end
