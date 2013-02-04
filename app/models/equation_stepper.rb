class EquationStepper

  def self.for(equation)
    left_expression = Expression.parse(equation.left.join(" "))
    right_expression = Expression.parse(equation.right.join(" "))
    if left_expression.linear_coefficient > 1
      DivisionStepper.new(left_expression.linear_coefficient, right_expression.constant)
    elsif left_expression.constant > 0
      SubtractionStepper.new(left_expression.constant, right_expression.constant)
    elsif left_expression.constant < 0
      AdditionStepper.new(-left_expression.constant, right_expression.constant)
    end
  end

end

class AbstractEquationStepper

  def initialize(augment_value, right_value)
    @augment_value = augment_value
    @right_value = right_value
  end

end

class DivisionStepper < AbstractEquationStepper

  def step
    Equation.new("/ #{@augment_value} = / #{@augment_value}")
  end

  def result
    new_right = @right_value / @augment_value
    Equation.new("x = #{new_right}")
  end

end

class SubtractionStepper < AbstractEquationStepper

  def step
    Equation.new("- #{@augment_value} = - #{@augment_value}")
  end

  def result
    new_right = @right_value - @augment_value
    Equation.new("x = #{new_right}")
  end

end

class AdditionStepper < AbstractEquationStepper

  def step
    Equation.new("+ #{@augment_value} = + #{@augment_value}")
  end

  def result
    new_right = @right_value + @augment_value
    Equation.new("x = #{new_right}")
  end

end