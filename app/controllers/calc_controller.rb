class CalcController < ApplicationController

  def input
  end

  def calc
    input = params[:num].to_i
    @result = input * 10
  end

end