class UserController < ApplicationController
  def portfolio
    @user = current_user
  end
end
