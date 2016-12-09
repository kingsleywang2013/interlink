# Preview all emails at http://localhost:3000/rails/mailers/apply_job_mailer
class ApplyJobMailerPreview < ActionMailer::Preview
  def apply_email
    ApplyJobMailer.apply_email(ApplyJob.first)
  end

  def employment_email
    ApplyJobMailer.employment_email(ApplyJob.first)
  end
end
