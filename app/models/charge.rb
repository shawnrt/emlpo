class Charge < ApplicationRecord
  belongs_to :membership
  belongs_to :membership_type

  def pluralize
    unless membership_type.duration.to_i / 12 < 1.1
      "s"
    end
  end

  def last_paid_time
    created_at - 4.hours
  end

  def price_cdn
    "#{membership_type.price / 100}.00 CDN"
  end

  def duration_name
    "#{membership_type.duration.to_i / 12} year#{pluralize} - #{membership_type.name}"
  end



end
