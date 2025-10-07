require_relative "board"

# CONSOLE TEST
board = Board.new
board.display
board.place_symbol(0, 0, "X")
board.display
board.place_symbol(1, 1, "O")
board.display
board.place_symbol(2, 2, "X")
board.display
board.reset
board.display
