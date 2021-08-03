# frozen_string_literal: true

require_relative "../connectors/aoc_connector"
require_relative "../helpers/password_checker"

# Day 2 solver
class PasswordListParser
  def solve
    puts "part1: #{count_valid_passwords(strategy: "inclusion")}"
    puts "part2: #{count_valid_passwords(strategy: "presence")}"
  end

  private

  def count_valid_passwords(strategy:)
    ::Connectors::AocConnector.new(endpoint: "day_2_input")
                              .parse_data
                              .map { |raw_password| PasswordChecker.new(raw_password, strategy) }
                              .select(&:valid?)
                              .count
  end
end
