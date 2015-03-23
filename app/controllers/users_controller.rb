class UsersController < ApplicationController
  def dashboard
  end

  def profile_page
  end

  def show
    @user = current_user
  end
end
