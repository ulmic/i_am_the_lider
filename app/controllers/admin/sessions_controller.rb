class Admin::SessionsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.find_by_login params[:admin][:login]
    if @admin && authenticate_admin?(@admin, params[:admin][:password])
      admin_sign_in @admin
      kedirect_to admin_welcome_index
    else
      @admin = Admin.new params[:admin]
      flash[:notice] = t('wrong_login')
      render action: :new
    end
  end

  def destroy
    admin_sign_out
    redirect_to :root
  end
end
