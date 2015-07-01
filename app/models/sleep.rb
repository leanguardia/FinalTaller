class Sleep < ActiveRecord::Base

	belongs_to :user

	def getDifference
		((awaken_at - started_at) / 1.hour).round(2)
	end

  def awake()
    self.awaken_at=DateTime.now + 6.hours
    self.save
  end
end
