class BandDatum < ActiveRecord::Base
  belongs_to :user
  belongs_to :band
  belongs_to :workout
end
