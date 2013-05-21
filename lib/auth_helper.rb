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

  def authenticate_user?(user, password)
    user.password === password
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def current_user?(user)
    current_user.id === user.id
  end

  #Admin auth
  def admin_sign_in(admin)
    session[:admin_id] = admin.id
  end

  def admin_signed_in?
    session[:admin_id] && Admin.find_by_id(session[:admin_id])
  end

  def admin_sign_out(admin)
    session[:admin_id] = nil
  end

  #Access
  
  def check_access_to_edit?(instance)
    admin_signed_in? || (user_signed_in? && instance.user_id == current_user.id)
  end
end
