class Record < ApplicationRecord
  belongs_to :user
  belongs_to :course

  after_find :check_expiration
  
  private
  def check_expiration
    if self.exp_date < Time.zone.now + 8.hours
      self.order_status = 0
    end
  end

end
