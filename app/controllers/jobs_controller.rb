class JobsController < ApplicationController
  layout :resolve_layout

  before_action :set_job, only: [:edit, :update, :destroy, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @jobs = Job.where(user_id: current_user.id)
  end

  def new
    @job = Job.new
  end

  def create

    job = Job.where(user_id:current_user.id)
    job_count = job.count
    if job_count < 3
      create_job
    end

    if job_count < 6 and (current_user.subscribed==true and current_user.planid=='interlink-job-basic')
      create_job
    end

    if job_count >= 3 and (current_user.subscribed==false)
      flash[:error] = "Sorry, you have met the limitation for posting 3 jobs,
                        if you want to post more jobs, please choose the following package to upgrade."
      redirect_to plans_path
    end

    if job_count >= 6 and (current_user.subscribed==true and current_user.planid=='interlink-job-basic')
      flash[:error] = "Sorry, you have met the limitation for posting 6 jobs,
                        if you want to post more jobs, please choose our Pro Package to upgrade."
      redirect_to plans_path
    end

    if job_count >= 6 and (current_user.subscribed==true and current_user.planid=='interlink-job-pro')
      create_job
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(jobs_param)
      flash[:success] = "The job was updated successfully"
      redirect_to job_path(@job)
    else
      render 'edit'
    end
  end

  def destroy
    @job.destroy
    flash[:danger] = "The job was removed successfully"
    redirect_to jobs_path
  end

  private
    def jobs_param
      params.require(:job).permit(:job_title, :employment_type, :job_location, :job_requirement)
    end

    def set_job
      @job = Job.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = "No specific job, please check your job again"
      redirect_to root_path
    end

    def resolve_layout
      case action_name
      when "new", "create", "update", "edit", "destroy", "index"
        "layouts/job"
      else
        "layouts/application"
      end
    end

    def create_job
      @job = Job.new(jobs_param)
      @job.user = current_user
      if @job.save
        flash[:success] = "The job was created successfully"
        redirect_to job_path(@job)
      else
        render 'new'
      end
    end

    def require_same_user
      if current_user != @job.user
        flash[:danger] = "Only owner can perform this action"
        redirect_to root_path
      end
    end
end
