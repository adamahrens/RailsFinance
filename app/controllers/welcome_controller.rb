class WelcomeController < ApplicationController
  def index
    logger.debug 'Fetching Apple stock'
    stock = StockQuote::Stock.quote('aapl')
    logger.debug "#{stock.symbol} - #{stock.company_name}: $#{stock.latest_price}"
  end
end
