class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to products_url, notice: "Logged in!"
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, notice: "Logged out!"
  end
end

# Let's walk through the code above step by step.
#
# We don't have to instantiate a user object in our new action because we are only logging in, not creating a new user.
# We find a user by the email typed in the email input field and assign it to the variable 'user'
# We check if that user exists and that it can be authenticated with the password typed in the password input field
# If both of those evaluate to 'true', we create a key-value pair in the session hash. ':user_id' is the key and the user's id is the value
# The session key has been assigned, the user is redirected to the products index page