module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
end


def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

#Returns true if the user is logged in, false otherwise
def logged_in?
  !current_user.nil?
end

#logs out of current user
def log_out
  session.delete(:user_id)
  @current_user = nil
end

def is_logged_in
  if !logged_in?
    flash[:notice] = "You must be logged in to access this path"
    redirect_to root_path
  end
end
end
