class WorksController < ApplicationController
  before_filter :check_user_signed
  def new
    @work = Work.new
  end

  def edit
    @work = Work.find params[:id]
    unless check_access_to_edit? @work
      redirect_to not_found_errors_path
    end
  end

  def create
    @work = Work.new params[:work]
    @work.user = User.find params[:id]
    if @work.save
      redirect_to @work.user, flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def update
    @work = Work.find params[:id]
    if @work.update_attributes params[:work]
      redirect_to @work.user, flash: :success
    else
      render action: :edit, flash: :error
    end
  end

  def destroy
    @work = Work.find params[:id]
    user = @work.user
    @work.destroy
    redirect_to user_path user, flash: :success
  end
end
