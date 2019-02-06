class Service < ApplicationRecord
  enum status: %i(offline in_transit online done)

  belongs_to :user
  belongs_to :office

  validates :date, :ticket_no, :status, presence: true

  before_save :set_default_status, if: -> { status.nil? }

  private

  def set_default_status
    self.status = 0
  end
end
