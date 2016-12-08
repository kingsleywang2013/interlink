class AddPlanIdToPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :plan_id, :string
  end
end
