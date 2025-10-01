class SumOfMultiples
    def initialize(*factors)
        @factors = factors.reject(&:zero?)
    end
    
    def to(limit)
        return 0 if @factors.empty?
        
        @factors.flat_map { |factor| (factor...limit).step(factor).to_a }
                .uniq
                .sum
    end
end