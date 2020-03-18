class StockChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.debug 'StockChannel#subscribed'
    stream_from "stock_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
