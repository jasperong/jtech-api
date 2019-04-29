class User < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :token_authenticatable

  enum role: %i(admin employer employee)

  has_many   :services

  before_validation :format_mobile
  before_validation :capitalize_name
  before_validation :generate_password
  before_validation :generate_auth_token
  after_initialize  :set_default_role
  after_create :send_password_email

  validates :email,      uniqueness: true, presence: true
  validates :mobile,     presence:   true
  validates :first_name, presence:   true
  validates :last_name,  presence:   true
  validate  :uniq_mobile

  def full_name
    "#{first_name} #{last_name}"
  end

  def mobile
    number_to_phone(read_attribute(:mobile))
  end

  def current_service
    services.where(status: ['online', 'in_transit'], date: Date.today).last
  end

  private

  def set_default_role
    self.role ||= :employee
  end

  def format_mobile
    if read_attribute(:mobile).present?
      self.mobile = read_attribute(:mobile).gsub(/[-() ]/, '')
    end
  end

  def uniq_mobile
    if User.where(mobile: read_attribute(:mobile)).exists? && mobile_changed?
      errors.add(:mobile, "is already taken.")
    end
  end

  def capitalize_name
    self.first_name = first_name.capitalize
    self.last_name  = last_name.capitalize
  end

  def generate_password
    self.password_confirmation = '123123'
    self.password              = '123123'
  end

  def generate_auth_token
    self.reset_authentication_token
    self.authentication_token_created_at = DateTime.now
  end

  def send_password_email
    self.send_reset_password_instructions
  end
end