class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.integer :user_id
      t.string :day_week
      t.datetime :alarm_hour
      t.boolean :state

      t.timestamps
    end
  end
end
