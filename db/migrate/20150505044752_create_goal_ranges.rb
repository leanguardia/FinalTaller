class CreateGoalRanges < ActiveRecord::Migration
  def change
    create_table :goal_ranges do |t|
      t.references :goal, index: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
