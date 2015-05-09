class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :sex, :string
    add_column :users, :weight, :float
    add_column :users, :height, :float
    add_column :users, :birthdate, :date
    add_column :users, :rol, :string
    add_column :users, :active, :boolean
  end
end
