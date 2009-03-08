class Event < ActiveRecord::Base
  belongs_to :group
  belongs_to :location
    
  validates_presence_of :name
  validates_presence_of :end_time
  validates_presence_of :start_time
  
  def validate
    self.errors.add(:start, "must be before the end date") if self.start_time > self.end_time
    self.errors.add(:end, "must be after the start date") if self.end_time < self.start_time
  end


end
