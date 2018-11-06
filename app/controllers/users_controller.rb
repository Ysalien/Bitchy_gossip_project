class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_users)
    if @user.save
    flash[:success] = "Successfully created on website!"
    redirect_to '/'
    else
    flash[:danger] = "Error"
    render 'new'
    end
  end

  private
  def params_users
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
