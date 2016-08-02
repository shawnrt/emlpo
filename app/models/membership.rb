class Membership < ApplicationRecord
  belongs_to :membership_type
  def last_paid_time
    created_at - 4.hours
  end
  def next_paid_time
    last_paid_time + 365.days
  end
  def email_communications_yesno
    email_communications ? 'Yes' : 'No'
  end
end
