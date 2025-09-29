=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end
class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError, "Size must be equal" if strand1.length != strand2.length
    tmp = 0
    strand1.each_char.with_index do |char, i|
        tmp += 1 if char != strand2[i]
    end
    tmp
  end
end