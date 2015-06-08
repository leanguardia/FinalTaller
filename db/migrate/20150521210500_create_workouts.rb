class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.references :user, index: true
      t.references :workout_type, index: true
      t.datetime :start
      t.datetime :end
      t.integer :calories
      t.integer :heartrate
      t.integer :steps
      t.string :name

      t.timestamps
    end
  end
end
