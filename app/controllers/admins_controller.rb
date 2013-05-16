class AdminsController < ApplicationController
  def login
    @admin = Admin.find_by_login(params[:login])
    if @admin.password === params[:password]
      admin_sign_in(@admin)
    else
      flash[:notice] = 'Вы авторизованы'
    end
    redirect_to '/login'
  end
  
  def logout
    session[:admin_id] = nil
    redirect_to '/'
  end
end
