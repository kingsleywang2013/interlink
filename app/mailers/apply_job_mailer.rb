class ApplyJobMailer < ApplicationMailer
  default from: "info@interlink.com"


  def apply_email(apply_job)
    @job = Job.find(apply_job.job_id)
    @url  = job_url(apply_job.job_id)
    mail(to:'current_user.email', subject: 'Notification for Job Application')
  end

end
