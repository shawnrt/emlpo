class Membership < ApplicationRecord
  belongs_to :membership_type
  has_many :charges
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :postal, presence: true
  validates :phone, presence: true
  validates :membership_type_id, presence: true

  def last_paid_time
    created_at - 4.hours
  end
  def next_paid_time
    if membership_type.duration.to_i / 12 < 1.1
      last_paid_time + 365.days
    else
      last_paid_time + 730.days
    end
  end
  def mailing_list
    email_communications == "true"
  end



end
