class UserController < ApplicationController
  def portfolio
    @user = current_user
    @stocks = @user.stocks.recently
  end
end
