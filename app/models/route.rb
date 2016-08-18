class Route < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  
  def create(name, startLat, startLon, endLat, endLon)
    self.name = name
    self.startLat = startLat
    self.startLon = startLon
    self.endLat = endLat
    self.endLon = endLon
  end
end