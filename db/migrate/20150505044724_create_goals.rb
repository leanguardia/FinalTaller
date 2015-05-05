class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :goal_type, index: true
      t.integer :target
      t.integer :current

      t.timestamps
    end
  end
end
