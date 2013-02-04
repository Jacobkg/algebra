class EquationStepper

  def self.for(equation)
    left_expression = Expression.parse(equation.left.join(" "))
    right_expression = Expression.parse(equation.right.join(" "))
    if left_expression.constant > 0
      SubtractionStepper.new(left_expression.constant, left_expression, right_expression)
    elsif left_expression.constant < 0
      AdditionStepper.new(-left_expression.constant, left_expression, right_expression)
    elsif left_expression.linear_coefficient > 1
      DivisionStepper.new(left_expression.linear_coefficient, left_expression, right_expression)
    end
  end

end

class AbstractEquationStepper

  def initialize(augment_value, left_expression, right_expression)
    @augment_value = augment_value
    @left_expression = left_expression
    @right_expression = right_expression
  end

end

class DivisionStepper < AbstractEquationStepper

  def step
    Equation.new("/ #{@augment_value} = / #{@augment_value}")
  end

  def result
    new_right = @right_expression / @augment_value
    new_left = @left_expression / @augment_value
    Equation.new("#{new_left} = #{new_right}")
  end

end

class SubtractionStepper < AbstractEquationStepper

  def step
    Equation.new("- #{@augment_value} = - #{@augment_value}")
  end

  def result
    new_left = @left_expression - Expression.parse(@augment_value.to_s)
    new_right = @right_expression - Expression.parse(@augment_value.to_s)
    Equation.new("#{new_left} = #{new_right}")
  end

end

class AdditionStepper < AbstractEquationStepper

  def step
    Equation.new("+ #{@augment_value} = + #{@augment_value}")
  end

  def result
    new_left = @left_expression + Expression.parse(@augment_value.to_s)
    new_right = @right_expression + Expression.parse(@augment_value.to_s)
    Equation.new("#{new_left} = #{new_right}")
  end

end