class CreateBandData < ActiveRecord::Migration
  def change
    create_table :band_data do |t|
      t.references :user, index: true
      t.references :band, index: true
      t.references :workout, index: true
      t.datetime :date_sent
      t.integer :steps_taken
      t.integer :calories_burnt
      t.integer :heart_rate_pminute
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
