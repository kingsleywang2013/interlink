class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profiles_params)
    @profile.user = current_user
    if @profile.save
      flash[:success] = "Well done, you have close to success nearly"
      redirect_to my_profile_path
    else
      render 'new'
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private
    def profiles_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :picture, :summary, :phone_no)
    end
end
