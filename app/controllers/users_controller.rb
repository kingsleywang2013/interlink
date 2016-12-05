class UsersController < ApplicationController

  def home
    @user = current_user
    @post = Post.new
    @posts = Post.all.order('created_at DESC')
  end

  def my_profile
    @profile = current_user.profile
    @posts = current_user.posts
    @post = Post.new
  end

  def my_jobs
    @jobs = Job.all
  end

  def my_friends
    @friends = current_user.friends
  end

  def my_saved_jobs
    @saved_jobs = current_user.jobs
  end

  def search_friend
    @users = User.search(params[:search_param])
    if @users
      @users = current_user.except_current_user(@users)
      render partial: 'friends/lookup'
    else
      render status: :not_found, nothing: true
    end
  end

  def search_job
    @job_results = Job.search(params[:job_title_search_param], params[:job_location_search_param])

    if @job_results
      render partial: 'jobs/lookup'
    else
      render status: :not_found, nothing: true
    end
  end

  def add_job
    job = Job.find(params[:job_id])
    user_job_relationship = current_user.user_job_relations.build(job_id: job.id)
    if current_user.save
      flash[:success] = "Job was saved successfully"
      redirect_to my_saved_jobs_path
    else
      flash[:error] = "There was something wrong with saving job"
      redirect_to my_jobs_path
    end
  end

  def add_friend
    friend = User.find(params[:friend_id])
    friendship = current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:success] = 'Friend was successfully added.'
      redirect_to my_friends_path
    else
      flash[:error] = 'There was something wrong with adding user as friend'
      redirect_to my_friends_path
    end
  end

end
