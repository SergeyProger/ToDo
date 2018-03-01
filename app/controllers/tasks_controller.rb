class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]
  # GET /tasks
  def index
    @tasks = Task.tasks_today
    @tasks_old = Task.tasks_old
    priority_new
    @next_tasks = Task.next_seven_day
    @completed_tasks = Task.where(completed: true).order('updated_at')
    @projects = Project.all
    @project = Project.new
    @task = Task.new

  end


  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path , notice: 'Task was successfully created.' }
        format.js
        format.json { render json: tasks_path, status: :created, location: tasks_path }
      else
        format.html { redirect_to tasks_path , notice: 'Task not add' }
        format.json { render json: @tasks.errors, status: :unprocessable_entity }
      end
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
    if @task.destroy
      redirect_to tasks_path, notice: 'Пользователь удалён.'
    else
    render json: {success: true}
    end
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
