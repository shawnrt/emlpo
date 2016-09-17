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
    mail({to: 'laurelmc@sympatico.ca',
          subject: 'New EMLPO Membership',
          from: "EMLPO <info@emlpo.ca>"})

  end


end
