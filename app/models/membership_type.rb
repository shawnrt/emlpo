class MembershipType < ApplicationRecord
  has_many :memberships
  def pluralize
    unless duration.to_i / 12 < 1.1
      "s"
    end
  end
  def display_name
    "#{name} - #{duration.to_i / 12} year#{pluralize}"
  end

  def display_name_price_cdn
    "#{name} - #{duration.to_i / 12} year#{pluralize} - #{price / 100}.00 CDN"
  end

  def duration_years
    "#{duration.to_i / 12}"
  end

  def price_cdn
    "#{price / 100}.00 CDN"
  end

end
