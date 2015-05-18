class User < ActiveRecord::Base
  has_many :goals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable


  # validates :name, presence: {:message => "Usted debe ingresar su nombre completo"}
  # validates :name, format: {:multiline => true, with: /^[a-zA-Z ]+$/, message: "Solo letras permitidas" }
  # validates :name, length: {minimum: 10, maximum: 45, :message => "El nombre de usuario debe tener entre 10 y 45 caracteres"}

  after_create :create_goals

  def get_age
    now = Time.now.utc.to_date
    now.year - self.birthdate.year - (self.birthdate.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def get_calories(age)
    if self.sex == 'Male'
      10 * self.weight + 6.25 * (self.height * 100) - 5 * age + 5 + 500
    else
      10 * self.weight + 6.25 * (self.height * 100) - 5 * age + 5 - 161 + 500
    end
  end

  def get_ideal_weight
    feet = (self.height * 100) * 0.0328084
    inches = feet * 12
    if self.sex == 'Male'
      52 + (1.9 * (inches - 60))
    else
      47 + (1.7 * (inches - 60))
    end
  end

  def get_sleep_hours(age)
    if age >= 65
      hours = 7.5
    elsif age > 25
        hours = 8
    elsif age > 14
      hours = 9
    else
      hours = 8
    end
    hours
  end

  def create_goals
    age = get_age
    hours = get_sleep_hours(age)
    calories = get_calories(age)
    weight = get_ideal_weight - self.weight

    if weight < 0
      g3 = Goal.new :user_id => self.id, :goal_type_id => 5, :target => (-1 * weight)
      g3.save
    elsif weight > 0
      g3 = Goal.new :user_id => self.id, :goal_type_id => 6, :target => weight
      g3.save
    else
    end

    g1 = Goal.new :user_id => self.id, :goal_type_id => 3, :interval => 1, :target => hours
    g1.save
    g2 = Goal.new :user_id => self.id, :goal_type_id => 2, :interval => 1, :target => calories
    g2.save
  end
end
