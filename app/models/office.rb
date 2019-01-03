class Office < ApplicationRecord
  has_many :users
  has_many :services
  validates :alias, presence: true

  def address
    "#{street_address}, #{city}"
  end

  def current_service
    services.where(date: Date.today)
  end
end
