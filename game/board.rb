class Board
  attr_reader :grid

  def initialize
    reset
  end

  def reset
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def display
    puts
    @grid.each_with_index do |row, i|
      display_row = row.map.with_index do |cell, j|
        cell == " " ? cell_number(i, j) : cell
      end
      puts " " + display_row.join(" | ")
      puts "---+---+---" unless i == 2
    end
    puts
  end

  def place_symbol(row, col, symbol)
    @grid[row][col] = symbol
  end

  def empty_cell?(row, col)
    @grid[row][col] == " "
  end

  def self.number_to_coordinates(number)
    number -= 1
    [number / 3, number % 3]
  end

  def winner?
    lines = @grid +
            @grid.transpose +
            [
              [@grid[0][0], @grid[1][1], @grid[2][2]],
              [@grid[0][2], @grid[1][1], @grid[2][0]]
]

    lines.each do |line|
      return line[0] if line.uniq.length == 1 && line[0] != " "
    end

    nil
  end

  private

  def cell_number(row, col)
    row * 3 + col + 1
  end
end
