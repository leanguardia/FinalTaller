class User < ActiveRecord::Base
  has_many :goals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :create_goals
  def create_goals
    g1 = Goal.new :user_id => self.id, :goal_type_id => 1, :end_date => (Time.zone.now + 1.days), :target => 2000
    g1.save
    g2 = Goal.new :user_id => self.id, :goal_type_id => 4, :end_date => (Time.zone.now + 1.days), :target => 2500
    g2.save
  end
end
