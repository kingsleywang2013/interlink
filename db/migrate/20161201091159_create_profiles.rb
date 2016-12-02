class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :summary
      t.string :job_title
      t.string :phone_no
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
