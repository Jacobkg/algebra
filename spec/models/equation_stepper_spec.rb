require 'spec_helper'

describe EquationStepper do

  it "subtracts from both sides for simple addition" do
    equation = Equation.new("x + 5 = 7")
    stepper = EquationStepper.for(equation)
    stepper.step.should == Equation.new("- 5 = - 5")
    stepper.result.should == Equation.new("x = 2")
  end

  it "adds to both sides for simple subtraction" do
    equation = Equation.new("x - 2 = 10")
    stepper = EquationStepper.for(equation)
    stepper.step.should == Equation.new("+ 2 = + 2")
    stepper.result.should == Equation.new("x = 12")
  end

  it "divides both sides for x with coefficient" do
    equation = Equation.new("3x = 12")
    stepper = EquationStepper.for(equation)
    stepper.step.should == Equation.new("/ 3 = / 3")
    stepper.result.should == Equation.new("x = 4")
  end

end