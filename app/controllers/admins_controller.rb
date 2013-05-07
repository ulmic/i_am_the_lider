class AdminsController < ApplicationController
  def login
    if session[:admin_id].nil?
      if request.post?
        @admin = Admin.find_by_login(params[:login])
        if @admin.nil?
         flash[:notice] = 'Неверный логин или пароль'
        else
          if @admin.password === params[:password]
            session[:admin_id] = @admin.id
            flash[:notice] = 'Вы успешно зарегистрированы.'
          else
            flash[:notice] = 'Неверный логин или пароль'
          end
        end
      end
    else
      @admin = Admin.find(session[:admin_id])
    end
  end
end
