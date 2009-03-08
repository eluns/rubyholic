class Event < ActiveRecord::Base
  belongs_to :group
  belongs_to :location
    
  validates_presence_of :name
  validates_presence_of :end
  validates_presence_of :start
 
  def validate
    self.errors.add(:start, "must be before the end date") if self.start > self.end
    self.errors.add(:end, "must be after the start date") if self.end < self.start
  end


end
