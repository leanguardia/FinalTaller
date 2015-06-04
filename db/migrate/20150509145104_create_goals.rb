class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.datetime :start_date
      t.integer :interval
      t.float :target
      t.float :reached
      t.references :goal_type, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
