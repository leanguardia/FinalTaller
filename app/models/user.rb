class User < ActiveRecord::Base

  has_many :goals
  
  attr_accessor :password,  :password_comfirmation
  before_save :prepare_password

 
  validates :name, presence: {:message => "You must enter a name"}
  validates :name, format: {:multiline => true, with: /^[a-zA-Z ]+$/, message: "Only  characters" }
  validates :name, length: {minimum: 5, maximum: 25, :message => "Name must be at least 5 characters"}
  
  validates :lastname, presence: {:message => "You must enter a lastname"}
  validates :lastname, format: {:multiline => true, with: /^[a-zA-Z ]+$/, message: "Only  characters" }
  validates :lastname, length: {minimum: 5, maximum: 25, :message => "LastName must be at least 5 characters"}

  validates :weight, presence: {:message => "You must enter a weight"}
  validates :weight, numericality: {greater_than: 0, message: "Only  numbers" }
  validates :weight, length: {minimum: 4, maximum: 7, :message => "Weight must be at least 4 numbers"}

  validates :height, presence: {:message => "You must enter a height"}
  validates :height, numericality: {greater_than: 0, message: "Only  numbers" }
  validates :height, length: {minimum: 4, maximum: 7, :message => "Height must be at least 4 numbers"}

  validates :email, presence: {:message => "You must enter a email"}
  validates :email, format:{ :multiline => true, with: /EMAIL_REGEX_GOES_HERE/, message: "Invalid format"}

  validates :password, presence: {:message => "You must enter a password"}
  validates :password, length: {minimum: 6, :message => "Password must be at least 4 numbers"}
  validates :password, confirmation: {:message => "Las contraseñas no coinciden"} 


  

  after_create :create_goals
  def create_goals
    g1 = Goal.new :user_id => self.id, :goal_type_id => 1, :end_date => (Time.zone.now + 1.days), :target => 2000
    g1.save
    g2 = Goal.new :user_id => self.id, :goal_type_id => 4, :end_date => (Time.zone.now + 1.days), :target => 2500
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
