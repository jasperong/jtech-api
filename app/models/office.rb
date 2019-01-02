class Office < ApplicationRecord
  validates :alias, presence: true

  def address
    "#{street_address}, #{city}"
  end
end
