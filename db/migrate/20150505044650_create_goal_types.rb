class CreateGoalTypes < ActiveRecord::Migration
  def change
    create_table :goal_types do |t|
      t.string :description
      t.string :unit_measured

      t.timestamps
    end
  end
end
