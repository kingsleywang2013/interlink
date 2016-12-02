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
      flash[:error] = "There is anything wrong when trying to create the profile"
      render 'new'
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profiles_params)
      flash[:success] = "Your profile have been updated succssfully"
      redirect_to my_profile_path
    else
      flash[:error] = "There is anything wrong when trying to update the profile"
      render 'edit'
    end
  end

  private
    def profiles_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :picture, :summary, :phone_no)
    end
end
