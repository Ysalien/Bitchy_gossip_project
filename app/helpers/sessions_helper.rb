module SessionsHelper
  
  #temporary session cookie when log in - expires when browser closed
  def log_in(user)
    session[:user_id] = user.id
  end

  #temporary session cookie -> applicate current_user session on subsequent pages
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  #Returns true if user logged in, false otherwise (show link log out if true)
  def logged_in?
    !current_user.nil?
  end

  #log out delete session -> current user = nil
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end


end
