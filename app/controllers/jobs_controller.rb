class JobsController < ApplicationController
  layout "layouts/job"
  def new
    @job = Job.new
  end

  def create

  end
end
