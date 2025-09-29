class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  
  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    unless first_operand.is_a?(Numeric) && second_operand.is_a?(Numeric)
      raise ArgumentError.new("Invalid operands")
    end
    
    unless ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation.new("Invalid operation")
    end
    
    result = case operation
    when '+'
      first_operand + second_operand
    when '*'
      first_operand * second_operand
    when '/'
      if second_operand == 0
        return "Division by zero is not allowed."
      end
      first_operand / second_operand
    end
    
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end
