class EquationsController < ApplicationController

  def index
    @equation = Equation.new(params[:equation])
    equation_stepper = EquationStepper.new(@equation)
    @step = equation_stepper.step
    @result = equation_stepper.result
  end

  def new
  end

end