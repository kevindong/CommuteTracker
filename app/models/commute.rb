class Commute < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(starttime: :desc) }
  
  def startcommute(lat, lon)
    if user.hasActiveCommute == true
      raise "Current user already has an active commute."
    end
    self.starttime = Time.now
    self.startLat = lat.to_f
    self.startLon = lon.to_f
  end
  
  def endcommute(lat, lon)
    if user.hasActiveCommute == false
      raise "Current user does not have an active commute."
    elsif user.currentCommute != self.id
      raise "Current commute does not belong to current user."
    end
    self.endtime = Time.now
    self.endLat = lat.to_f
    self.endLon = lon.to_f
  end
end