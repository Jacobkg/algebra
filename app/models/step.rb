class Step

  attr_reader :operator, :value

  def initialize(operator, value)
    @operator = operator
    @value = value
  end

  def left
    "#{operator} #{value}"
  end

  def right
    left
  end

  def ==(other)
    operator == other.operator && value == other.value
  end

end