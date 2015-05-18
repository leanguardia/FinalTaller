class ChangeGoalsOlumns < ActiveRecord::Migration
  def self.up
    change_column :goals, :end_date, :integer
    rename_column :goals, :end_date, :interval
  end

  def self.down
    change_column :goals, :end_date, :datetime
    rename_column :goals, :interval, :end_date
  end
end
