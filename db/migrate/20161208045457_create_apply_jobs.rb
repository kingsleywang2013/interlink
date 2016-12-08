class CreateApplyJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :apply_jobs do |t|
      t.string :cover_letter
      t.string :resume
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
