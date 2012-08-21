class Account < ActiveRecord::Base

  paginates_per 20
  
  attr_accessible :name, :password, :password_confirmation, :email, :year, :admin, :workers_attributes
 
  
  attr_accessor :updating_password, :creating_account #This is not a real field, just a placeholder when doing updates that require a password

  default_scope order: 'name ASC'

  has_secure_password

  before_save {|account| account.email = email.downcase }
  before_save :create_remember_token
  before_create {|account| account.year = "2012-2013"}

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: 	true,
  									format: 		{with: VALID_EMAIL_REGEX},
  									uniqueness: {case_insensitive: false}

  validates :password, length: {minimum: 6}, :if => :should_validate_password?
  validates :password_confirmation, presence: true, :if => :should_validate_password?

  

  def create_remember_token
    if self.remember_token.nil?
      self.remember_token = SecureRandom.urlsafe_base64
    end
  end

  def total_hours_worked
    self.events.sum('hours_worked')
  end

  def events
     VolunteerEvent.joins(:worker => :account).where(:accounts => {id: self.id})
  end


  has_many :workers
  
  accepts_nested_attributes_for :workers, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    temp_password = SecureRandom.urlsafe_base64
    self.password = temp_password
    self.password_confirmation = temp_password
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Account.exists?(column => self[column])
  end


  def should_validate_password?
    updating_password || new_record?
  end

end
