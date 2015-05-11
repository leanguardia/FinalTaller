class Band < ActiveRecord::Base
  belongs_to :user
  belongs_to :Band_type
end
