class CreateUserJobRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_job_relations do |t|
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
