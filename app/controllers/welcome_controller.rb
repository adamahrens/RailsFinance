class WelcomeController < ApplicationController
  def index
    if params[:stocks]
      logger.debug "Fetching #{params[:stocks]} stock"
      stock = StockQuote::Stock.quote(params[:stocks])
      logger.debug "#{stock.symbol} - #{stock.company_name}: $#{stock.latest_price}"
      @stock = Stock.new(ticker: stock.symbol,
                         name: stock.company_name,
                         price: stock.latest_price)
    end
  end
end
