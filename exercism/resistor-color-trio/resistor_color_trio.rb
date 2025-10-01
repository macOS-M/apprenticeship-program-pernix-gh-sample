class ResistorColorTrio
    COLOR_CODES = {
      "black" => 0,
      "brown" => 1,
      "red" => 2,
      "orange" => 3,
      "yellow" => 4,
      "green" => 5,
      "blue" => 6,
      "violet" => 7,
      "grey" => 8,
      "white" => 9
    }
  
    def initialize(colors)
      @colors = colors.to_s.gsub(/[\[\]"]/, '').split(/\s*,\s*/)
    end
  
    def value
      first_two = @colors.first(2)
      first_two.map { |color| COLOR_CODES[color] }.join.to_i
    end
  
    def multiplier
      10 ** COLOR_CODES[@colors[2]]
    end
  
    def total_value
      value * multiplier
    end
  
    def label
      val = total_value
      unit = "ohms"
  
      if val >= 1_000_000_000
        val /= 1_000_000_000
        unit = "gigaohms"
      elsif val >= 1_000_000
        val /= 1_000_000
        unit = "megaohms"
      elsif val >= 1_000
        val /= 1_000
        unit = "kiloohms"
      end
  
      "Resistor value: #{val} #{unit}"
    end
  end
  