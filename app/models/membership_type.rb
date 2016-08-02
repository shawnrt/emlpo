class MembershipType < ApplicationRecord
  has_many :memberships
  def display_name
    "#{name} - #{duration.to_i / 12} years"
  end

  def duration_years
    "#{duration.to_i / 12}"
  end

  def price_cdn
    "#{price / 100}.00 CDN"
  end

end
