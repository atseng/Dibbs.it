require 'spec_helper'

describe 'User can send email invites' do %q{

  As a User
  I want to be able to send emails to friends
  So my friends can sign up

  AC
  * User can send an email invitation

}
  describe 'User sending an email invite' do
    let(:user) { FactoryGirl.create(:user) }
    it "if the user is not yet registered, send them an invitation email." do
      sign_in(user)
      visit users_path
      click_link "Invite a friend"
      fill_in "Friend's email address", with: "friend_does_not_exist@test.com"
      click_button "Invite!"
      expect(page).to have_content("Your friend invitation has been sent")
      last_invitation = ActionMailer::Base.deliveries.last
      expect(last_invitation.body.raw_source).to have_content("You are invited to join Dibbs")
      expect(Invitation.all.count).to eq(1)
    end
  end


end
