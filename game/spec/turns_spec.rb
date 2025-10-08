require_relative '../player'

RSpec.describe "Turn alternation" do
  before do
    @player1 = Player.new("Player 1", "X")
    @player2 = Player.new("Player 2", "O")
    @players = [@player1, @player2]
    @current_player_index = 0
  end

  it 'alternates turns between two players' do
    expect(@players[@current_player_index].symbol).to eq("X")
    
    # switch turn
    @current_player_index = 1 - @current_player_index
    expect(@players[@current_player_index].symbol).to eq("O")

    # switch again
    @current_player_index = 1 - @current_player_index
    expect(@players[@current_player_index].symbol).to eq("X")
  end
end
