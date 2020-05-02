class Record < ApplicationRecord
  belongs_to :user
  belongs_to :course

  before_save :check_expiration

  private
  def check_expiration
    if self.exp_date < Time.zone.now
      self.order_status = 0
    end
  end
end
