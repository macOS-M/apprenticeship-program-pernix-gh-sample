=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end
class TwelveDays
    def self.song
        days = %w[first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth]
        gifts = [
            "a Partridge in a Pear Tree.",
            "two Turtle Doves, and ",
            "three French Hens, ",
            "four Calling Birds, ",
            "five Gold Rings, ",
            "six Geese-a-Laying, ",
            "seven Swans-a-Swimming, ",
            "eight Maids-a-Milking, ",
            "nine Ladies Dancing, ",
            "ten Lords-a-Leaping, ",
            "eleven Pipers Piping, ",
            "twelve Drummers Drumming, "
        ]
        
        verses = (0..11).map do |i|
            verse_lines = []
            verse_lines << "On the #{days[i]} day of Christmas my true love gave to me: "
            (i.downto(0)).each do |j|
                verse_lines << gifts[j]
            end
            verse_lines.join("")
        end
        
        verses.join("\n\n") + "\n"
    end
end