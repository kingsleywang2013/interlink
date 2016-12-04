class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.string :employment_type
      t.string :job_requirement
      t.string :job_location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
