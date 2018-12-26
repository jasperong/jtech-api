class User < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: %i(admin employer employee)

  before_validation :format_mobile
  before_validation :capitalize_name
  after_initialize :set_default_role

  validates :email,      uniqueness: true, presence: true
  validates :mobile,     uniqueness: true, presence: true
  validates :first_name, presence:   true, on: :update
  validates :last_name,  presence:   true, on: :update

  def full_name
    "#{first_name} #{last_name}"
  end

  def mobile
    number_to_phone(read_attribute(:mobile))
  end

  private

  def set_default_role
    self.role ||= :employee
  end

  def format_mobile
    self.mobile = read_attribute(:mobile).gsub(/[-() ]/, '') if read_attribute(:mobile).present?
  end

  def capitalize_name
    self.first_name = first_name.capitalize
    self.last_name  = last_name.capitalize
  end
end