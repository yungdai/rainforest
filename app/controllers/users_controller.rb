class UsersController < ApplicationController
  # The next two methods new and create are used to create a new user method
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to products_url, notice: "Signed up!"
    else
      # send back to create new user page with a flash saying "Uh Oh! Something bad happened."
      flash.now[:alert] = "Uh oh! Something bad happened."
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
