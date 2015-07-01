class AddSleepQualityToBandDatum < ActiveRecord::Migration
  def change
    add_column :band_data, :sleep_quality, :integer
  end
end
