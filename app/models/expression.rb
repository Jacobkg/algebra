class Expression

  def self.parse(expression_string)
    if expression_string.include? " + "
      left_expression, right_expression = expression_string.split(" + ").map {|n| Expression.parse(n)}
      left_expression + right_expression
    elsif expression_string.include? " - "
      left_expression, right_expression = expression_string.split(" - ").map {|n| Expression.parse(n)}
      left_expression - right_expression
    else
      Expression.new(parse_linear(expression_string), parse_constant(expression_string))
    end
  end

  attr_reader :linear_coefficient, :constant

  def initialize(linear, constant)
    @linear_coefficient = linear
    @constant = constant
  end

  def +(other)
    Expression.new(linear_coefficient + other.linear_coefficient, constant + other.constant)
  end

  def -(other)
    Expression.new(linear_coefficient - other.linear_coefficient, constant - other.constant)
  end

  def /(a_constant)
    Expression.new(linear_coefficient / a_constant, constant / a_constant)
  end

  def ==(other)
    linear_coefficient == other.linear_coefficient && constant == other.constant
  end

  def to_s
    if linear_coefficient == 0
      "#{constant}"
    elsif constant > 0
      "#{linear_for_string} + #{constant}"
    elsif constant < 0
      "#{linear_for_string} - #{-constant}"
    else
      "#{linear_for_string}"
    end
  end

  private

  def linear_for_string
    return "x" if linear_coefficient == 1
    return "-x" if linear_coefficient == -1
    return "#{linear_coefficient}x"
  end

  def self.parse_linear(string)
    x_token = string.strip.split(" ").select {|n| n.include? "x"}.first
    return 0 if x_token.nil?
    return 1 if x_token == "x"
    return -1 if x_token == "-x"
    x_token.gsub("x", "").to_i
  end

  def self.parse_constant(string)
     constant_token = string.strip.split(" ").select {|n| is_numeric?(n) }.first
     constant_token.to_i
  end

  def self.is_numeric?(obj)
   obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

end