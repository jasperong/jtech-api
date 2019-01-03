class Service < ApplicationRecord
  enum status: %i(offline in_transit online)

  belongs_to :user_id
  belongs_to :office_id
end
