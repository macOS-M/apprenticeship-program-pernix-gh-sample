=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end
class Clock
    def initialize(hour: 0, minute: 0)
        total_minutes = hour * 60 + minute
        
        total_minutes = total_minutes % (24 * 60)
        
        @hours = total_minutes / 60
        @minutes = total_minutes % 60
    end

    def to_s
        format('%02d:%02d', @hours, @minutes)
    end
    
    def +(other)
        Clock.new(hour: @hours, minute: @minutes + other.total_minutes)
    end
    
    def -(other)
        Clock.new(hour: @hours, minute: @minutes - other.total_minutes)
    end
    
    def ==(other)
        total_minutes == other.total_minutes
    end
    
    def total_minutes
        @hours * 60 + @minutes
    end
    
    
end