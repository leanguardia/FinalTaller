class Goal < ActiveRecord::Base
  belongs_to :goal_type
  belongs_to :user

  before_create :set_values


  # validates :target, presence: {:message => "Usted debe ingresar el target"}
  # validates :target, length: {minimum: 2, maximum: 4, :message => "El target debe tener minimo numeros"}
 

  def set_values
    self.reached = 0
    self.start_date = Time.zone.now

    case self.end_date
      when 1
        self.end_date = Time.zone.now + 1.days
      when 2
        self.end_date = Time.zone.now + 7.days
      when 3
        self.end_date = Time.zone.now + 30.days
      when 4
        self.end_date = Time.zone.now + 90.days
      when 5
        self.end_date = Time.zone.now + 180.days
      when 6
        self.end_date = Time.zone.now + 364.days
      else
        self.end_date = Time.zone.now + 1.days
    end
  end
end
