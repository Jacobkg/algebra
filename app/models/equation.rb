class Equation

  attr_reader :left, :right

  def initialize(equation_string)
    @left, @right = equation_string.split(" = ")
  end

  def left
    @left.split(" ")
  end

  def right
    @right.split(" ")
  end

  def ==(other)
    self.left == other.left && self.right == other.right
  end

end