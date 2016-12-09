class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]
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
    @user = @profile.user
    @posts = @user.posts
    @jobs = @user.jobs
  end

  def edit

  end

  def update
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

    def set_profile
      @profile = Profile.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = "No specific profile, please check your profile again"
      redirect_to root_path

    end

    def require_same_user
      if current_user != @profile.user
        flash[:danger] = "You can only edit your own profile"
        redirect_to root_path
      end
    end
end
