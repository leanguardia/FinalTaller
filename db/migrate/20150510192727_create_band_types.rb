class CreateBandTypes < ActiveRecord::Migration
  def change
    create_table :band_types do |t|
      t.string :model

      t.timestamps
    end
  end
end
