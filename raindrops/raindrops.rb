=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end
class Raindrops
    def self.convert(num)
        string = ""
        string += "Pling" if num % 3 == 0
        string += "Plang" if num % 5 == 0
        string += "Plong" if num % 7 == 0
        string = num.to_s if string.empty?
        string
    end
end