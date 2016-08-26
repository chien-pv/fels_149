module SessionsHelper
  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by id: user_id
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by id: user_id
      if user && user.authenticated?(cookies[:remember_token])
        login user
        @current_user = user
      end
    end
  end

  def login user
    session[:user_id]= user.id
  end

  def remember user
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    forget current_user
    session.delete :user_id
    @current_user = nil
  end


  def current_user? user
    user == current_user
  end

  def render_root_page_login user
    if user.is_admin?
      redirect_to admin_root_path
    else
      redirect_to user_path user
    end
  end
end
