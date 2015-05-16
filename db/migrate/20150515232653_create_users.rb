class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :sex
      t.float :weight
      t.float :height
      t.date :birthdate
      t.string :role
      t.boolean :active
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
