class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: %i(admin employer employee)
  after_initialize :set_default_role

  private

  def set_default_role
    self.role ||= :employee
  end
end
