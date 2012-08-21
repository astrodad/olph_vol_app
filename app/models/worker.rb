class Worker < ActiveRecord::Base
  attr_accessible :email, :name, :stand_certified, :stand_expiration_date, 
  		:occupation, :relationship, :phone
  attr_accessible :activity_workers_attributes

  before_save {|worker| worker.phone = phone.gsub(/\D/, '') }


  belongs_to	:account
  has_many :VolunteerEvents, :dependent => :destroy

  has_many :activity_workers
  has_many :activities, through: :activity_workers

  accepts_nested_attributes_for :activity_workers, allow_destroy: true

  validates	:name, presence: true, length: {maximum: 60}
  validates :stand_expiration_date, presence: true, if: :stand_certified?
  validates :occupation, presence: true, length: {maximum: 60}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, format: { with: VALID_EMAIL_REGEX }, presence: true
  
  #accepts_nested_attributes_for :volunteerevents, :reject_if => lambda { |a| a[:hours].blank? }, :allow_destroy => true

  def worker_interests
    
    self.activities.where(interest: true)

  end

  def friendly_phone
    ActionController::Base.helpers.number_to_phone(self.phone)
  end

  RELATIONSHIPS = ['Parent', 'Grandparent', 'Sibling', 'Step-parent', 'Friend']

end
