class Service < ApplicationRecord
  enum status: %i(offline in_transit online)

  belongs_to :user
  belongs_to :office
end
