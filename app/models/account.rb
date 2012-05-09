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

end
