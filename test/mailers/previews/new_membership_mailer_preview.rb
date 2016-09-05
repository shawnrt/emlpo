# Preview all emails at http://localhost:3000/rails/mailers/new_membership_mailer
class NewMembershipMailerPreview < ActionMailer::Preview

  def welcome_email
    NewMembershipMailer.welcome_email(Membership.last)
  end

  def welcome_email_admin
    NewMembershipMailer.welcome_email_admin(Membership.last)
  end

end
