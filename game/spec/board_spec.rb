require_relative '../board'

RSpec.describe Board do
  describe '#initialize' do
    it 'creates an empty 3x3 grid' do
      board = Board.new
      expect(board.grid.size).to eq(3)
      expect(board.grid.all? { |row| row.size == 3 }).to be true
      expect(board.grid.flatten.all? { |cell| cell == " " }).to be true
    end
  end

  describe '#place_symbol' do
    it 'places a symbol in the indicated position' do
      board = Board.new
      board.place_symbol(0, 0, "X")
      expect(board.grid[0][0]).to eq("X")
    end
  end

  describe '#display' do
    it 'prints the board to the console without errors' do
      board = Board.new
      expect { board.display }.to output.to_stdout
    end
  end

  describe '#winner?' do
    it 'detects a horizontal win' do
      board = Board.new
      board.place_symbol(0, 0, "X")
      board.place_symbol(0, 1, "X")
      board.place_symbol(0, 2, "X")
      expect(board.winner?).to eq("X")
    end

    it 'detects a vertical win' do
      board = Board.new
      board.place_symbol(0, 1, "O")
      board.place_symbol(1, 1, "O")
      board.place_symbol(2, 1, "O")
      expect(board.winner?).to eq("O")
    end

    it 'detects a diagonal win' do
      board = Board.new
      board.place_symbol(0, 0, "X")
      board.place_symbol(1, 1, "X")
      board.place_symbol(2, 2, "X")
      expect(board.winner?).to eq("X")
    end

    it 'returns nil if there is no winner' do
      board = Board.new
      board.place_symbol(0, 0, "X")
      board.place_symbol(1, 1, "O")
      board.place_symbol(2, 2, "X")
      expect(board.winner?).to be_nil
    end
  end

  describe '#draw' do
    it 'returns true when all cells are filled and no winner' do
      board = Board.new
      symbols = %w[X O X O X O O X O]
      symbols.each_with_index do |symbol, i|
        row, col = Board.number_to_coordinates(i + 1)
        board.place_symbol(row, col, symbol)
      end
      expect(board.winner?).to be_nil
      expect(board.grid.flatten.none? { |cell| cell == " " }).to be true
    end
  end
end
