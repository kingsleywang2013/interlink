class UserJobRelationsController < ApplicationController

  def destroy
    job = Job.find(params[:id])
    user_job_relationship = current_user.user_job_relations.where(job_id: job.id).first
    user_job_relationship.destroy
    flash[:danger] = "The saved job was removed successfully."
    redirect_to my_saved_jobs_path
  end
end
