class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Logged in"
      log_in user #use method from helpers - temporary cookie
      redirect_to '/'
    else
       flash[:danger] = 'Invalid email or password combination'
      render 'new'
    end
  end

    def destroy
      log_out if logged_in? #method from helpers
      flash[:success] = 'Logged out'
      redirect_to '/'
    end

end
