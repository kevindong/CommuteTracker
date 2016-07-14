class Commute < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(starttime: :desc) }
  
  def startcommute
    self.starttime = Time.now
  end
  
  def endcommute
    self.endtime = Time.now
  end
end
