class NewMembershipMailer < ApplicationMailer

  default from: 'EMLPO <info@emlpo.ca>'

  def welcome_email(membership)
    @membership = membership
    mail({to: [@membership.email],
          subject: 'Welcome to EMLPO',
          from: "EMLPO <info@emlpo.ca>"})

  end

  def welcome_email_admin(membership)
    @membership = membership
    mail({to: 'info@emlpo.ca',
          subject: 'New Membership',
          from: "EMLPO <membership@emlpo.ca>"})

  end


end
