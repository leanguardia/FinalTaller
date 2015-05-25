class Band < ActiveRecord::Base
  belongs_to :user
  belongs_to :Band_type

  before_create :set_values
  before_update :set_values

  def self.get_types
    type = Array.new
    BandType.all.each do |x|
      type << [x.model, x.id]
    end

    type
  end

  def self.get_color
    colors = Array.new
    colors << ['Blue', 1]
    colors << ['Green', 2]
    colors << ['Red', 3]
    colors
  end

  def set_values
    logger.info self.color
    val = self.color
    case val
      when '1'
        self.color = 'blue'
      when '2'
        self.color = 'green'
      when '3'
        self.color = 'red'
      else
        self.color = 'blue'
    end
  end
end
