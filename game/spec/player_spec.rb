require_relative '../player'

RSpec.describe Player do
  describe '#initialize' do
    it 'correctly assigns the name and symbol' do
      player = Player.new("Alice", "X")
      expect(player.name).to eq("Alice")
      expect(player.symbol).to eq("X")
    end
  end

  describe '#to_s' do
    it 'returns the player name and symbol' do
      player = Player.new("Bob", "O")
      expect(player.to_s).to eq("Bob (O)")
    end
  end
end
