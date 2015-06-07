class Goal < ActiveRecord::Base
  belongs_to :goal_type
  belongs_to :user

  before_create :set_values


  validates :target, presence: {:message => 'Goal target must be set'},
                     length: {minimum: 1, :message => 'must have at least one number' }
  # validates :target, length: {minimum: 1, maximum: 4, :message => "El target debe tener minimo numeros"}
 

  def self.get_types
    type = Array.new
    GoalType.all.each do |x|
      type << [x.typename, x.id]
    end

    type
  end

  def self.get_times
    times = Array.new
    times << ['1 day', 1]
    times << ['1 week', 2]
    times << ['1 month', 3]
    times << ['3 months', 4]
    times << ['6 months', 5]
    times << ['1 year', 6]

    times
  end

  def self.generate_history(current_user_id, current_goal)
    current_goal = Goal.find(current_goal)
    goals = Array.new
    today = Time.zone.now
    while current_goal.start_date < today
      goals << calculate_measure(current_user_id, current_goal, true)
      current_goal = current_goal.dup
      current_goal.start_date += current_goal.interval.days
    end
    goals
  end

  def self.get_sum(data, end_date, start_date)
    calories = 0
    steps = 0
    data.each do |record|
      if record.date_sent < end_date && record.date_sent > start_date
        calories += record.calories_burnt
        steps += record.steps_taken
      end
    end
    result = Hash.new
    result[:steps] = steps
    result[:calories] = calories
    result
  end

  def self.calculate_measure(current_user_id, goal, ret = false)
    data = BandDatum.where(user_id: current_user_id)
    end_date = goal.start_date + goal.interval.days

    results = self.get_sum(data, end_date, goal.start_date)

    if ret
      if goal.goal_type_id == 1
        goal.reached = results[:steps]
      elsif goal.goal_type_id == 2
        goal.reached = results[:calories]
      end
      goal
    else
      if goal.goal_type_id == 1
        goal.update(reached: results[:steps])
      elsif goal.goal_type_id == 2
        goal.update(reached: results[:calories])
      end
    end
  end

  def set_values
    self.reached = 0
    self.start_date = Time.zone.now

    case self.interval
      when 1
        self.interval = 1
      when 2
        self.interval = 7
      when 3
        self.interval = 30
      when 4
        self.interval = 90
      when 5
        self.interval = 180
      when 6
        self.interval = 364
      else
        self.interval = 1
    end
  end
end
