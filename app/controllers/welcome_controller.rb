class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if current_user and (current_user.profile.present? == true)
      redirect_to home_path
    end
    if current_user and (current_user.profile.present? == false )
      redirect_to new_profile_path
    end
  end

end
