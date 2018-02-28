class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]


  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to tasks_path , notice: 'Project was successfully created.' }
        format.js
        format.json { render json: tasks_path, status: :created, location: tasks_path }
      else
        format.html { redirect_to tasks_path , notice: 'Project not add' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
    end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to tasks_path, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    if complite_task?
    @project.destroy
    redirect_to tasks_url, notice: 'Project was successfully destroyed.'
    else
      redirect_to tasks_url, notice: 'Остались не завершонные задачи.'
    end
  end


  private

    def complite_task?
      current_tasks.each do |completed|
        completed == false
        return false
      end
     return true
    end
    # Use callbacks to share common setup or constraints between actions.
    def current_tasks
      @tasks = Task.where(project_id: @project.id)
    end
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :colorpro)
    end
end
