class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :color
      t.references :user, index: true
      t.references :Band_type, index: true

      t.timestamps
    end
  end
end
