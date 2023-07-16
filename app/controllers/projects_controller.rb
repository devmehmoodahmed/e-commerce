class ProjectsController < ApplicationController
  # before_action :check_admin_or_vendor, except: [:index]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.vendor_id = current_user.id
    if @project.save
      redirect_to projects_path, notice: "Project created successfully."
    else
      # Project creation failed, show errors
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      # Project update successful
      redirect_to projects_path, notice: "Project updated successfully."
    else
      # Project update failed, show errors
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Project deleted successfully."
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, category_ids: [])
  end

  def check_admin_or_vendor
    if !(current_user.admin? || current_user.vendor?)
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end
# 