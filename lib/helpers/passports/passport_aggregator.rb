# frozen_string_literal: true

module Helpers
  module Passports
    # takes in the parsed data from the input file and returns a hash of the
    # parsed data
    class PassportAggregator
      def initialize(raw_passports)
        @raw_passports = raw_passports
      end

      def aggregate
        aggregation = raw_passports.each_with_object([""]) do |raw_passport, aggregated_passports|
          aggregated_passports << "" if raw_passport.empty?

          aggregated_passports[-1] += " #{raw_passport}"
        end

        aggregation.map!(&:strip)
      end

      private

      attr_reader :raw_passports
    end
  end
end
