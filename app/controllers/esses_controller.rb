class EssesController < ApplicationController
  before_filter :check_user_signed
  def new
    @esse = Esse.new
  end

  def edit
    @esse = Esse.find params[:id]
    unless check_access_to_edit? @esse
      redirect_to :root
    end
  end

  def create
    @esse = Esse.new params[:esse]
    @esse.user = User.find params[:id]
    if @esse.save
      redirect_to @esse.user, flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @esse = Esse.find params[:id]
    if check_access_to_edit? @esse
      if @esse.update_attributes params[:esse]
        redirect_to @esse.user, flash: :success
      else
        render action: :edit, flash: :error
      end
    else
      redirect_to @esse.user, notice: t('without_access_to_edit')
    end
  end

  def destroy
    @esse = Esse.find params[:id]
    user = @esse.user
    @esse.destroy
    redirect_to user_path user, flash: :success
  end
end
