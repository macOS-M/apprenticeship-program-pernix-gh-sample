class SaddlePoints
end

class Grid
  def self.saddle_points(matrix)
    return [] if matrix.empty? || matrix.first.empty?
    
    saddle_points = []
    rows = matrix.length
    cols = matrix.first.length
    
    (0...rows).each do |row|
      (0...cols).each do |col|
        value = matrix[row][col]
        
        row_max = matrix[row].max
        col_min = (0...rows).map { |r| matrix[r][col] }.min
        
        if value == row_max && value == col_min
          saddle_points << { "row" => row + 1, "column" => col + 1 }
        end
      end
    end
    
    saddle_points
  end
end