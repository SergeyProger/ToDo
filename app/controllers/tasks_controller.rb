class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.tasks_today
    @tasks_old = Task.tasks_old
    priority_new
    @completed_tasks = Task.where(completed: true).order('updated_at')
    @projects = Project.all
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def complete
    @task = Task.find params[:id]
    @task.complete!
    redirect_to tasks_path
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end


  private

  def priority_new
    @tasks_old_priority = Task.tasks_old
    @tasks_old_priority.each do |task|
      task.priority_now!
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:task_name, :priority, :completed, :project_id, :time_done)
    end
end
