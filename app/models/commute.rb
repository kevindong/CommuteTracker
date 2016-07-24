class Commute < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(starttime: :desc) }
  
  def startcommute(lat, lon)
    if user.hasActiveCommute == true
      raise "Current user already has an active commute."
    end
    self.starttime = Time.now
    if (is_float(lat) && is_float(lon))
      self.startLat = lat.to_f
      self.startLon = lon.to_f
    end
  end
  
  def endcommute(lat, lon)
    if user.hasActiveCommute == false
      raise "Current user does not have an active commute."
    elsif user.currentCommute != self.id
      raise "Current commute does not belong to current user."
    end
    self.endtime = Time.now
    if (is_float(lat) && is_float(lon))
      self.endLat = lat.to_f
      self.endLon = lon.to_f
    end
  end
  
  private
  def is_float(input)
    if (input.nil? || input.blank?)
      return false
    end
    if (input.is_a? Float)
      return true
    elsif (input.to_f != 0.0)
      return true
    else
      return false
    end
  end
end