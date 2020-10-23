class UsersController < ApplicationController

  def show 
    @user = current_user if current_user
  end
  
end