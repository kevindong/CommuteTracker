class Commute < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(starttime: :desc) }
  
  def startcommute(lat, lon)
    if user.hasActiveCommute == true
      raise "Current user already has an active commute."
    end
    self.starttime = Time.now
    self.startLat = is_float(lat) ? lat.to_f : nil
    self.startLon = is_float(lon) ? lon.to_f : nil
  end
  
  def endcommute(lat, lon)
    if user.hasActiveCommute == false
      raise "Current user does not have an active commute."
    elsif user.currentCommute != self.id
      raise "Current commute does not belong to current user."
    end
    self.endtime = Time.now
    self.endLat = is_float(lat) ? lat.to_f : nil
    self.endLon = is_float(lon) ? lon.to_f : nil
  end
  
  private
  def is_float(input)
    begin
      input.to_f
      return true unless input.blank?
    rescue
      return false
    end
  end
end