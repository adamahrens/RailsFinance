# == Schema Information
#
# Table name: stocks
#
#  id         :bigint           not null, primary key
#  ticker     :string
#  name       :string
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stock < ApplicationRecord
  validates :ticker, presence: true
  validates :name, presence: true
  validates :price, numericality: { only_integer: false }

  belongs_to :user

  scope :recently, -> { order(created_at: :desc) }

  def formatted_date
    created_at.strftime('%m/%d/%Y %H:%M:%S')
  end

  def self.fetch(symbol)
    stock = StockQuote::Stock.quote(symbol.downcase)
    logger.debug "#{stock.symbol}-#{stock.company_name}:$#{stock.latest_price}"
    Stock.new(ticker: stock.symbol,
              name: stock.company_name,
              price: stock.latest_price)
  end
end
