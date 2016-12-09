class ApplyJobMailer < ApplicationMailer
  default from: "info@interlink.com"


  def apply_email(apply_job)
    @job = Job.find(apply_job.job_id)
    @url  = job_url(apply_job.job_id)
    @user = User.find(apply_job.user_id)
    mail(to:"#{@user.email}", subject: 'Notification for Job Application')
  end

  def employment_email(apply_job)

    @job = Job.find(apply_job.job_id)
    @employer = User.find(@job.user_id)
    @applicant = User.find(apply_job.user_id)
    @url  = profile_url(@applicant.profile)
    @resume = apply_job.resume
    mail(to:"#{@employer.email}", subject: 'Notification for Job Application')
  end

end
