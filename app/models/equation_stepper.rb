class EquationStepper

  def self.for(equation)
    if equation.left.constant > 0
      SubtractionStepper.new(equation.left.constant, equation)
    elsif equation.left.constant < 0
      AdditionStepper.new(-equation.left.constant, equation)
    elsif equation.left.linear_coefficient > 1
      DivisionStepper.new(equation.left.linear_coefficient, equation)
    end
  end

end

class AbstractEquationStepper

  def initialize(augment_value, equation)
    @augment_value = augment_value
    @equation = equation
  end

end

class DivisionStepper < AbstractEquationStepper

  def step
    Step.new("/", @augment_value)
  end

  def result
    new_right = @equation.right / @augment_value
    new_left = @equation.left / @augment_value
    Equation.new("#{new_left} = #{new_right}")
  end

end

class SubtractionStepper < AbstractEquationStepper

  def step
    Step.new("-", @augment_value)
  end

  def result
    new_left = @equation.left - Expression.parse(@augment_value.to_s)
    new_right = @equation.right - Expression.parse(@augment_value.to_s)
    Equation.new("#{new_left} = #{new_right}")
  end

end

class AdditionStepper < AbstractEquationStepper

  def step
    Step.new("+", @augment_value)
  end

  def result
    new_left = @equation.left + Expression.parse(@augment_value.to_s)
    new_right = @equation.right + Expression.parse(@augment_value.to_s)
    Equation.new("#{new_left} = #{new_right}")
  end

end