class Admin::SessionsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.find_by_login params[:admin][:login]
    if @admin && authenticate_admin?(@admin, params[:admin][:password])
      admin_sign_in @admin
      flash_now! :success
      redirect_to admin_welcome_index_path
    else
      @admin = Admin.new params[:admin]
      flash[:notice] = t('wrong_login')
      render action: :new
    end
  end

  def destroy
    admin_sign_out
    flash_now! :success
    redirect_to :root
  end
end
