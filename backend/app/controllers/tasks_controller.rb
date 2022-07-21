# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_task, only: %i[show update destroy]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render_validation_errors(@task.errors)
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render_validation_errors(@task.errors)
    end
  end

  # DELETE /tasks/1
  def destroy
    render_validation_errors(@task.errors) unless @task.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find_by_friendly_id(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :description, :project_id, :start_date, :end_date).tap do |p|
      p[:user_id] = current_user.id
      project = Project.find_by_friendly_id(p[:project_id])
      p[:project_id] = project&.id
    end
  end
end
