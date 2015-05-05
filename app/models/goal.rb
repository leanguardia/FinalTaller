class Goal < ActiveRecord::Base
  belongs_to :goal_type
  belongs_to :user
  has_one :goal_range
end
