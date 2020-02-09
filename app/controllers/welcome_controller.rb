class WelcomeController < ApplicationController
  def index
    if params[:stocks]
      logger.debug "Fetching #{params[:stocks]} stock"
      begin
        @stock = Stock.fetch(params[:stocks])
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
