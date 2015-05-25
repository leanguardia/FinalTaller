class User < ActiveRecord::Base

  has_many :goals
  has_many :workouts
  has_one  :band
  
  attr_accessor :password,  :password_comfirmation
  before_save :prepare_password

 
  validates :name, presence: {:message => "You must enter a name"}
  validates :name, format: {:multiline => true, with: /^[a-zA-Z ]+$/, message: "Only  characters" }
  validates :name, length: {minimum: 2, maximum: 25, :message => "Name must have at least 2 characters"}
  
  validates :lastname, presence: {:message => "You must enter a lastname"}
  validates :lastname, format: {:multiline => true, with: /^[a-zA-Z ]+$/, message: "Only  characters" }
  validates :lastname, length: {minimum: 2, maximum: 25, :message => "Last Name must have at least 2 characters"}

  validates :weight, presence: {:message => "You must enter a weight"}
  validates :weight, numericality: {greater_than: 0, message: "Only  numbers" }
  validates :weight, length: {minimum: 2, maximum: 7, :message => "Weight must have at least 2 numbers"}

  validates :height, presence: {:message => "You must enter a height"}
  validates :height, numericality: {greater_than: 0, message: "Only  numbers" }
  validates :height, length: {minimum: 3, maximum: 7, :message => "Height must have at least 3 numbers"}

  validates :email, presence: {:message => "You must enter a email"}
  validates :email, format:{ :multiline => true, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/, message: "Invalid mail format"}

  #validates :password, presence: {:message => "You must enter a password"}
  #validates :password, length: {minimum: 6, :message => "Password must have at least 6 characters"}
  #validates :password, confirmation: {:message => "Passwords don't match"}


  

  after_create :create_goals

  def get_age
    now = Time.now.utc.to_date
    now.year - self.birthdate.year - (self.birthdate.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def get_calories(age)
    calories = 10 * self.weight + 6.25 * (self.height * 100) - 5 * age + 5 + 500
    if self.sex == 'Female'
      calories = calories - 161
    end
    calories
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

  def self.authenticate(login, pass)
    user = find_by_email(login)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

private

   def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end


end
