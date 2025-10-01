=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end
class Luhn
  def self.valid?(string)
    new(string).valid?
  end

  def initialize(string)
    @string = string.to_s
  end

  def valid?
    return false if invalid_input?
    return false if single_digit?
    
    digits = extract_digits
    return false if digits.length <= 1
    
    luhn_sum(digits) % 10 == 0
  end



  def invalid_input?
    @string.match?(/[^\d\s]/)
  end

  def single_digit?
    digits = extract_digits
    digits.length == 1 && digits.first == 0
  end

  def extract_digits
    @string.gsub(/\s/, '').chars.map(&:to_i)
  end

  def luhn_sum(digits)
    sum = 0
    digits.reverse.each_with_index do |digit, index|
      if index.odd?
        doubled = digit * 2
        sum += doubled > 9 ? doubled - 9 : doubled
      else
        sum += digit
      end
    end
    sum
  end
end