class VolunteerEvent < ActiveRecord::Base
  attr_accessible :event_date, :hours_worked, :name, :hour_worked, :minute_worked


  attr_accessor :user_update, :hour_worked, :minute_worked

  validates	:name, presence: true,
  									length: {maximum: 80}
  validates :hours_worked, presence: true,
  									numericality: {only_integer: true}
  validates :event_date, presence: true
  validates_date	:event_date, :on_or_before => Date.current,
                               :on_or_after => lambda { 30.days.ago },
                               :if => :should_validate_date?
  


  belongs_to :worker
  #belongs_to :eventtype

  default_scope order: 'event_date DESC'

  WillPaginate.per_page = 15

  def should_validate_date?
    user_update
  end

  def event_worked_summary
    hours_summary_for_seconds(self.hours_worked)
  end

  
end
