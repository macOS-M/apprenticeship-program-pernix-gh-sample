=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end
class Acronym
    def self.abbreviate(string)
        words = string.split(/[\s_\-]+/)
        words.map do |word|
            cleaned = word.gsub(/[^a-zA-Z]/, "")  
            cleaned[0]&.downcase                  
    end.compact.join.upcase
   end
end
