class Goal < ActiveRecord::Base
  belongs_to :goal_type
  belongs_to :user

  before_create :set_reached

  def set_reached
    self.reached = 0
    self.start_date = Time.zone.now
  end
end
