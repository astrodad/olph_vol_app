class Worker < ActiveRecord::Base
  attr_accessible :email, :name


  belongs_to	:account
  has_many :VolunteerEvents, :dependent => :destroy

  validates	:name, presence: true, length: {maximum: 100}
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, format:     { with: VALID_EMAIL_REGEX },
	#                    uniqueness: { case_sensitive: false }

	#accepts_nested_attributes_for :volunteerevents, :reject_if => lambda { |a| a[:hours].blank? }, :allow_destroy => true
  
end
