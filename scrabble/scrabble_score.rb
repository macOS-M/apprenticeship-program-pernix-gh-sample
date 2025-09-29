=begin
Write your code for the 'Scrabble Score' exercise in this file. Make the tests in
`scrabble_score_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/scrabble-score` directory.
=end
SCORES = {
    %w[A E I O U L N R S T] => 1,
    %w[D G]                 => 2,
    %w[B C M P]             => 3,
    %w[F H V W Y]           => 4,
    %w[K]                   => 5,
    %w[J X]                 => 8,
    %w[Q Z]                 => 10
  }
  
class Scrabble
  def initialize(word)
    @word = word
  end

  def score()
    return 0 if @word.nil?
    
    @word.upcase.chars.sum do |char|
      score_for_char(char)
    end
  end


  def score_for_char(char)
    SCORES.each do |letters, score|
      return score if letters.include?(char)
    end
    0
  end
end