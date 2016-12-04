class JobsController < ApplicationController
  layout "layouts/job"

  def index
    @jobs = current_user.jobs
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_param)
    @job.user = current_user
    if @job.save
      flash[:success] = "The job was created successfully"
      redirect_to job_path(@job)
    else
      render 'new'
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(jobs_param)
      flash[:success] = "The job was updated successfully"
      redirect_to job_path(@job)
    else
      render 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:danger] = "The job was removed successfully"
    redirect_to jobs_path
  end

  private
    def jobs_param
      params.require(:job).permit(:job_title, :employment_type, :job_location, :job_requirement)
    end
end
