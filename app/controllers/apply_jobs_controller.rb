class ApplyJobsController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @apply_job = ApplyJob.new
  end

  def create
    @apply_job = ApplyJob.new(job_params)
    job = Job.find(params[:job_id])
    @apply_job.job_id = job.id
    @apply_job.user_id = current_user.id
    if @apply_job.save
      ApplyJobMailer.apply_email(@apply_job).deliver_later
      flash[:succuss] = "Your application for this job has been sent to the employer,
                          please check the copy of email in your mail inbox"
      redirect_to my_jobs_path
    else
      render 'new'
    end
  end

  private
    def job_params
      params.require(:apply_job).permit(:cover_letter, :resume)
    end

end
