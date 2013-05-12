module AuthHelper
  def basic_auth
    authenticate_or_request_with_http_basic do |user, password|
      user == configus.basic_auth.username && password == configus.basic_auth.password
    end
  end

  # User auth
  def user_sign_in(user)
    session[:user_id] = user.id
  end

  def user_sign_out
    session[:user_id] = nil
  end

  def user_signed_in?
    session[:user_id] && User.find_by_id(session[:user_id])
  end

  def authenticate_user!
    redirect_to new_admin_session_path unless user_signed_in?
  end

  def current_user?
    @current_user ||= User.find(session[:user_id])
  end

  #Admin auth
  def admin_sign_in(admin)
    session[:admin_id] = admin.id
  end
end