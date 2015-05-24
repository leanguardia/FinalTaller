class CreateWorkoutTypes < ActiveRecord::Migration
  def change
    create_table :workout_types do |t|
      t.string :typename
      t.boolean :outside

      t.timestamps
    end
  end
end
