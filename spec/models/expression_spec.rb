require 'spec_helper'

describe Expression do

  it "has linear and constant coefficients" do
    expression = Expression.parse("2x + 7")
    expression.linear_coefficient.should == 2
    expression.constant.should == 7
  end

  it "accepts its coefficients in any order" do
    expression = Expression.parse("6 + 5x")
    expression.linear_coefficient.should == 5
    expression.constant.should == 6
  end

  it "x is 1x" do
    expression = Expression.parse("x")
    expression.linear_coefficient.should == 1
  end

  it "absence of a token is 0" do
    expression = Expression.parse("")
    expression.linear_coefficient.should == 0
    expression.constant.should == 0
  end

  it "handles negative operator" do
    Expression.parse("x - 5").constant.should == -5
    Expression.parse("3 - x").linear_coefficient.should == -1
  end
end