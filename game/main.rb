require_relative 'board'
require_relative 'player'

board = Board.new
player1 = Player.new("Player 1", "X")
player2 = Player.new("Player 2", "O")
current_player = player1

loop do
  board.display
  puts "#{current_player}, choose a number (1-9) to place your symbol:"
  
  input = gets.chomp.to_i
  if input.between?(1, 9)
    row, col = Board.number_to_coordinates(input)
    if board.empty_cell?(row, col)
      board.place_symbol(row, col, current_player.symbol)
      current_player = current_player == player1 ? player2 : player1
    else
      puts "That cell is already taken! Try again."
    end
  else
    puts "Invalid input! Enter a number between 1 and 9."
  end
end
