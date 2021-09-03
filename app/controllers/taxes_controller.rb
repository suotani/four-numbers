class TaxesController < ApplicationController

  def index
    @taxes = Tax.all
  end


  def new
    @tax = Tax.new
  end

  def create
    create_params = params.require(:tax).permit(:rate, :name)
    @tax = Tax.new(create_params)
    if @tax.save
      # 成功
      redirect_to taxes_path
    else
      # 失敗
      render :new
    end
  end

end