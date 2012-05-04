class VolunteerEvent < ActiveRecord::Base
  attr_accessible :event_date, :hours_worked, :name

  validates	:name, presence: true,
  									length: {maximum: 80}
  validates :hours_worked, presence: true,
  									numericality: {only_integer: true}
  validates :event_date, presence: true
  validates_date	:event_date
  

  belongs_to :worker
  #belongs_to :eventtype
  
end
