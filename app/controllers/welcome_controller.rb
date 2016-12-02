class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if current_user and current_user.profile.present?
      redirect_to home_path

    else

      redirect_to new_profile_path
    end
  end

end
