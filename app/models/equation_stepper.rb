class EquationStepper

  def initialize(equation)
    @equation = equation
  end

  def step
    Equation.new("#{operator} #{augment_value} = #{operator} #{augment_value}")
  end

  def result
    new_left = evaluate(@equation.right.first.to_i, augment_value.to_i, operator)
    Equation.new("x = #{new_left}")
  end

  private

  def operator
    @equation.left.include?("+") ? "-" : "+"
  end

  def augment_value
    @equation.left.last
  end

  def evaluate(val1, val2, operator)
    if operator == "+"
      val1 + val2
    else
      val1 - val2
    end
  end

end