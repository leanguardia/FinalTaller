class Sleep < ActiveRecord::Base

	belongs_to :user

	def getDifference
		((awaken_at - started_at) / 1.hour).round(2)
	end
end
