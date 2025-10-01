class SpiralMatrix
    def initialize(size)
        @matrix = Array.new(size) { Array.new(size) }
        fill_spiral(size)
    end
    
    def matrix
        @matrix
    end
    
    private
    
    def fill_spiral(size)
        return if size == 0
        
        num = 1
        left, right, top, bottom = 0, size - 1, 0, size - 1

        while left <= right && top <= bottom
            (left..right).each { |i| @matrix[top][i] = num; num += 1 }
            top += 1
            
            (top..bottom).each { |i| @matrix[i][right] = num; num += 1 }
            right -= 1
            
            if top <= bottom
                right.downto(left) { |i| @matrix[bottom][i] = num; num += 1 }
                bottom -= 1
            end
            
            if left <= right
                bottom.downto(top) { |i| @matrix[i][left] = num; num += 1 }
                left += 1
            end
        end
    end
end