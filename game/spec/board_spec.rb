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
end
