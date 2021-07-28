# frozen_string_literal: true

module Connectors
  # Input fetcher
  class AocConnector
    def initialize(endpoint:)
      @endpoint = endpoint
    end

    def parse_data
      file = File.open("#{__dir__}/../../inputs/#{endpoint}")
      file.readlines.map(&:chomp)
    end

    private

    attr_reader :endpoint
  end
end
