=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end
class Series
    def initialize(digits)
        raise ArgumentError, "Empty" if digits.nil? || digits.empty?
        @digits = digits
    end

    def slices(length)
        raise ArgumentError, "Enter positive value" if length <= 0
        raise ArgumentError, "Slice cannot be larger than digits" if length > @digits.length

        result = []
        0.upto(@digits.length - length) do |i|
            result << @digits[i, length]
        end
        result
    end

end