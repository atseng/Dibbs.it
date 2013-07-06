class Mailer < ActionMailer::Base
  def invitation(invitation)
    @new_user_registration_url = new_user_registration_url
    invitation.update_attribute(:sent_at, Time.now)
    mail(
      :to => invitation.recipient_email,
      :subject => 'Invitation to join Dibbs',
      :from => 'admin@dibbs.it')
  end


end
