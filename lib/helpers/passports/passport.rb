module Helpers
  module Passports
    class Passport
      REQUIRED_KEYS = %w[byr iyr eyr hgt hcl ecl pid].freeze

      def initialize(stringified_passport)
        @content = stringified_passport
        .split
        .map { |input| input.split(':') }
        .to_h
      end

      def valid?(validation_method = 'weak')
        # puts "checking passport #{content}"

        REQUIRED_KEYS.each do |key|
          return false unless content.key?(key)

          if validation_method == 'strong' && !send("valid_#{key}?", content[key])
            # puts "invalid #{key}"
            return false
          end
        end
        true
      end

      private

      attr_reader :content

      def valid_byr?(byr)
        byr.to_i.between?(1920, 2002)
      end

      def valid_iyr?(iyr)
        iyr.to_i.between?(2010, 2020)
      end

      def valid_eyr?(eyr)
        eyr.to_i.between?(2020, 2030)
      end

      def valid_hgt?(hgt)
        case hgt[-2..]
        when 'cm'
          hgt[..-2].to_i.between?(150, 193)
        when 'in'
          hgt[..-2].to_i.between?(59, 76)
        else
          false
        end
      end

      HCL_REGEX = /\A#([a-f]|\d{6})\z/
      def valid_hcl?(hcl)
        HCL_REGEX.match?(hcl)
      end

      ECL_VALUES = %w[amb blu brn gry grn hzl oth]
      def valid_ecl?(ecl)
        ECL_VALUES.include?(ecl)
      end

      PID_REGEX = /\A\d{9}\z/
      def valid_pid?(pid)
        PID_REGEX.match?(pid)
      end
    end
  end
end
