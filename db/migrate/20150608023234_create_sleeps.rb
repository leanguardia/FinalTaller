class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.datetime :started_at
      t.datetime :awaken_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
