=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end
class Tournament
    def self.tally(input)
        teams = Hash.new { |hash, key| hash[key] = { MP: 0, W: 0, D: 0, L: 0, P: 0 } }

        input.each_line do |line|
            team1, team2, result = line.strip.split(';')
            next if team1.nil? || team2.nil? || result.nil?

            teams[team1][:MP] += 1
            teams[team2][:MP] += 1

            case result
            when 'win'
                teams[team1][:W] += 1
                teams[team1][:P] += 3
                teams[team2][:L] += 1
            when 'loss'
                teams[team2][:W] += 1
                teams[team2][:P] += 3
                teams[team1][:L] += 1
            when 'draw'
                teams[team1][:D] += 1
                teams[team1][:P] += 1
                teams[team2][:D] += 1
                teams[team2][:P] += 1
            end
        end

        sorted_teams = teams.sort_by { |name, stats| [-stats[:P], name] }

        header = "Team                           | MP |  W |  D |  L |  P"
        rows = sorted_teams.map do |name, stats|
            format("%-30s | %2d | %2d | %2d | %2d | %2d", name, stats[:MP], stats[:W], stats[:D], stats[:L], stats[:P])
        end

        ([header] + rows).join("\n") + "\n"
    end
end
