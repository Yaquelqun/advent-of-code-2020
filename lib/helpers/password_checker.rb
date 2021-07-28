
class PasswordChecker

  def initialize(raw_password_input, strategy)
    args = /(\d+)-(\d+) (.): (.*)/.match(raw_password_input)
    @occurence_range = (args[1].to_i..args[2].to_i)
    @letter, @password = args[3], args[4]
    @strategy = strategy
  end

  def valid?
    send("validate_#{strategy}")
  end

  private

  attr_reader :occurence_range, :letter, :password, :strategy

  def validate_inclusion
    occurence_range.include?(password.count(letter))
  end

  def validate_presence
    (password[@occurence_range.first - 1] == letter) ^ (password[@occurence_range.last - 1] == letter)
  end
end
