class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :type
      t.string :requirement
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
