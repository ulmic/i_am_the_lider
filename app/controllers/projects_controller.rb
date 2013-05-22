#encoding: utf-8
class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
    unless check_access_to_edit?(@project)
      redirect_to "/404"
    end
  end

  def create
    @project = Project.new(params[:project])
    if user_signed_in?
      @project.user_id = session[:user_id]
      if @project.save
        redirect_to @project.user, notice: 'Проект успешно добавлен.'
      else
        render action: "new"
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    if check_access_to_edit?(@project)
      if @project.update_attributes(params[:project])
        redirect_to @project.user, notice: 'Запись обновлена.'
      else
        render action: "edit"
      end
    else
      redirect_to @project.user, notice: 'Вы не можете редактировать эту запись!'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if check_access_to_edit?(@project)
      @project.destroy
      redirect_to projects_url
    else
      redirect_to @project.user, notice: "Вы не можете удалить эту запись"
    end
  end
end
