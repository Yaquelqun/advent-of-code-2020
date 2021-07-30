# frozen_string_literal: true

require_relative "../helpers/passports/passport_fetcher"
require_relative "../helpers/passports/passport_aggregator"
require_relative "../helpers/passports/passport"

module AdventOfCode2020
  # Solver for day 4
  class PassportParser
    def initialize
      @passports = generate_passports
    end

    def solve
      puts "part 1: valid passports: #{passports.select(&:valid?).count}"
      puts "part 1: valid passports: #{passports.select { |passport| passport.valid?("strong") }.count}"
    end

    private

    attr_reader :passports

    def generate_passports
      raw_passports = Helpers::Passports::PassportFetcher.new.fetch

      Helpers::Passports::PassportAggregator.new(raw_passports)
                                            .aggregate
                                            .map { |passport_input| Helpers::Passports::Passport.new(passport_input) }
    end
  end
end
