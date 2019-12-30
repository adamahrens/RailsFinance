Rails.logger.debug 'Setting up stock'
StockQuote::Stock.new(api_key: Rails.application.credentials.dig(:stock, :api_secret))
Rails.logger.debug 'Stock setup complete'
