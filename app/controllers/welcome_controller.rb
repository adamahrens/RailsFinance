class WelcomeController < ApplicationController
  def index
    if params[:stocks]
      logger.debug "Fetching #{params[:stocks]} stock"
      begin
        @stock = Stock.fetch(params[:stocks])
        logger.debug "Updating user's stocks"
        current_user.stocks << @stock
        @stock.save
        ActionCable.server.broadcast(
          "stock_channel",
          stock: { id: @stock.id,
               ticker: @stock.ticker,
                price: sprintf("$%2.2f", @stock.price),
              company: @stock.name,
                 date: @stock.formatted_date }
        )
        respond_to do |format|
          format.html
          format.js { render partial: 'welcome/stock' }
          format.json { render json: @stock }
        end
      rescue RuntimeError => e
        logger.error e
        logger.debug "Unable to fetch #{params[:stocks]} stock"
      end
    end
  end
end
