class Expression

  def self.parse(expression_string)
    if expression_string.include? "+"
      left_expression, right_expression = expression_string.split("+").map {|n| Expression.parse(n)}
      Expression.new(left_expression.linear_coefficient + right_expression.linear_coefficient,
                     left_expression.constant + right_expression.constant)
    elsif expression_string.include? "-"
      left_expression, right_expression = expression_string.split("-").map {|n| Expression.parse(n)}
      Expression.new(left_expression.linear_coefficient - right_expression.linear_coefficient,
                     left_expression.constant - right_expression.constant)
    else
      Expression.new(parse_linear(expression_string), parse_constant(expression_string))
    end
  end

  attr_reader :linear_coefficient, :constant

  def initialize(linear, constant)
    @linear_coefficient = linear
    @constant = constant
  end

  private

  def self.parse_linear(string)
    x_token = string.strip.split(" ").select {|n| n.include? "x"}.first
    return 0 if x_token.nil?
    return 1 if x_token == "x"
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