class StocksController < ApplicationController
  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    flash[:success] = 'Stock destroyed'
    redirect_to portfolio_path
  end
end
