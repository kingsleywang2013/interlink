class PlansController < ApplicationController

  def index
    @basic = Plan.find(1)
    @pro = Plan.find(2)
  end

  def new

  end

  def create
    if params[:plan_id] == "1"
      plan = Plan.find(1)
      token = params[:basic_plan][:token]
      customer = Stripe::Customer.create(
        :card => token,
        :plan => plan.plan_id,
        :email => current_user.email
      )
      current_user.subscribed = true
      current_user.planid = plan.plan_id
      current_user.save

      flash[:success] = "Thank you for subscribing our Basic package."
      redirect_to new_job_path

    else
      plan = Plan.find(2)
      token = params[:pro_plan][:token]
      customer = Stripe::Customer.create(
        :card => token,
        :plan => plan.plan_id,
        :email => current_user.email
      )
      current_user.subscribed = true
      current_user.planid = plan.plan_id
      current_user.save

      flash[:success] = "Thank you for subscribing our Pro package."
      redirect_to new_job_path

    end

  end

end
