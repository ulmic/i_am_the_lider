class EssesController < ApplicationController
  def new
    @esse = esse.new
  end

  def show
    @esse = Esse.find params[:id]
    redirect_to @esse.user
  end

  def edit
    @esse = Esse.find params[:id]
    unless check_access_to_edit? @esse
      redirect_to :root
    end
  end

  def create
    @esse = Esse.new params[:esse]
    if user_signed_in?
      @esse.user_id = params[:id]
      if @esse.save
        redirect_to @esse.user, flash: :success
      else
        render action: :new, flash: :error
      end
    else
      redirect_to User.find params[:id]
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
    @esse.destroy
    redirect_to esses_url, flash: :success
  end
end
