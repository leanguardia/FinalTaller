class User < ActiveRecord::Base
  has_many :goals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
=begin
  validates :name, presence: {:message => "Usted debe ingresar su nombre completo"}
  validates :name, format: {:multiline => true, with: /^[a-zA-Z ]+$/, message: "Solo letras permitidas" }
  validates :name, length: {minimum: 10, maximum: 45, :message => "El nombre de usuario debe tener entre 10 y 45 caracteres"}  
=end
  after_create :create_goals
  def create_goals
    g1 = Goal.new :user_id => self.id, :goal_type_id => 1, :end_date => (Time.zone.now + 1.days), :target => 2000
    g1.save
    g2 = Goal.new :user_id => self.id, :goal_type_id => 4, :end_date => (Time.zone.now + 1.days), :target => 2500
    g2.save
  end
end
