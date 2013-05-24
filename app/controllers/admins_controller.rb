#encoding: utf-8
class AdminsController < ApplicationController
  def login
    @admin = Admin.new
    if admin_signed_in?
      redirect_to "/admins/panel"
    else
      @admin = Admin.find_by_login(params[:login])
      if @admin && authenticate_user?(@admin, params[:password])
        admin_sign_in @admin
        redirect_to "/admins/panel"
      else
        flash[:notice] = "Неверный логин или пароль"
      end
    end
  end
  
  def logout
    admin_sign_out
    redirect_to :root
  end

  def panel
  end
end
