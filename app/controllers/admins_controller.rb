#encoding: utf-8
class AdminsController < ApplicationController
  def login
    if admin_signed_in?
      redirect_to "admins#admin"
    else
      @admin = Admin.find_by_login(params[:login])
      if @admin && authenticate_user?(@admin, params[:password])
        admin_sign_in(@admin)
        redirect_to "admins#admin"
      else
        flash.now[:error] = "Ошибка авторизации"
      end
    end
  end
  
  def logout
    session[:admin_id] = nil
    redirect_to '/'
  end
end
