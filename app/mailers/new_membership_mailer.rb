class NewMembershipMailer < ApplicationMailer

  default from: 'EMLPO <info@emlpo.ca'

  def welcome_email(membership)
    @membership = membership
    mail({to: [@membership.email],
          subject: 'Welcome to EMLPO',
          from: "EMLPO <info@emlpo.ca>"})

  end


end
