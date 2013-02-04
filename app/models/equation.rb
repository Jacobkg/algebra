class Equation

  attr_reader :left, :right

  def initialize(equation_string)
    @left, @right = equation_string.split(" = ").map { |n| Expression.parse(n) }
  end

  def ==(other)
    self.left == other.left && self.right == other.right
  end

end