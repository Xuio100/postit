class User < ActiveRecord::Base
  include Sluggable

  has_many :posts
  has_many :comments

  has_secure_password validations: false

  validates :username,
    presence: true,
    uniqueness: true
  validates :password,
    presence: true,
    on: :create,
    length: { minimum: 5 }
  validates :phone,
    length: { is: 10 },
    allow_blank: true,
    numericality: true
  validates :pin,
    length: { minimum: 4, maximum: 8 },
    allow_blank: true,
    numericality: true

  sluggable_column :username

  def admin?
    role == 'admin'
  end

  def two_factor_auth?
    !self.phone.blank?
  end

  def generate_pin!
    self.update_column(:pin, rand(10 ** 6)) #random 6 digit number
  end

  def send_pin_to_twilio!
    if two_factor_auth?
      msg = "Hi, to proceed with your login, please input pin: #{self.pin}"
      account = TWILIO_CLIENT.account
      message = account.sms.messages.create({:from => TWILIO_FROM_NUMBER, :to => self.phone, :body => msg})
    end
  end
end
