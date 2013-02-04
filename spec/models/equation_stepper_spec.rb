require 'spec_helper'

describe EquationStepper do

  it "subtracts from both sides for simple addition" do
    equation = Equation.new("x + 5 = 7")
    stepper = EquationStepper.new(equation)
    stepper.step.should == Equation.new("- 5 = - 5")
    stepper.result.should == Equation.new("x = 2")
  end

  it "adds to both sides for simple subtraction" do
    equation = Equation.new("x - 2 = 10")
    stepper = EquationStepper.new(equation)
    stepper.step.should == Equation.new("+ 2 = + 2")
    stepper.result.should == Equation.new("x = 12")
  end

end