# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_project, only: %i[show update destroy]

  # GET /projects
  def index
    @projects = Project.all

    render json: @projects
  end

  # GET /projects/:id
  def show
    render json: @project
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created, location: @project
    else
      render_validation_errors(@project.errors)
    end
  end

  # PATCH/PUT /projects/:id
  def update
    if @project.update(project_params)
      render json: @project
    else
      render_validation_errors(@project.errors)
    end
  end

  # DELETE /projects/:id
  def destroy
    render_server_errors unless @project.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find_by_friendly_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :icon, :description).tap do |p|
      p[:user_id] = current_user.id
    end
  end
end
