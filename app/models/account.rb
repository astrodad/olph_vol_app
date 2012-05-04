class Account < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :email, :year, :admin, :workers_attributes
  has_secure_password

  before_save {|account| account.email = email.downcase }
  before_save :create_remember_token
  before_create {|account| account.year = "2012-2013"}

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: 	true,
  									format: 		{with: VALID_EMAIL_REGEX},
  									uniqueness: {case_insensitive: false}
  validates :password, length: {minimum: 6}
  validates :password_confirmation, presence: true
  

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

  def total_hours_worked
    self.events.sum('hours_worked')
  end

  def events
     VolunteerEvent.joins(:worker => :account).where(:accounts => {id: self.id})
  end


  has_many :workers
  
  accepts_nested_attributes_for :workers, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

end
