class Triangle
    attr_reader :sides
    def initialize(sides)
        @sides = sides
    end
    def equilateral?
        sides.uniq.length == 1 && valid?
    end
    def isosceles?
        sides.uniq.length <= 2 && valid?
    end
    def scalene?
        sides.uniq.length == 3 && valid?
    end

    def valid?
        a, b, c = sides
        a + b > c && a + c > b && b + c > a && sides.all? { |side| side > 0 }
    end
end