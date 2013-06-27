require 'spec_helper'

describe 'User can request a friendship' do %q{

  As a User
  I want to ask another user to be my friend
  So I can call dibbs on their items for lending

  AC
  * I can ask a user to be my friend from their profile
  * The user can accept my friend request
  * I'm notified when a user accepts my friend request

}

  describe 'User can make a friend request' do
  let!(:friend1) {FactoryGirl.create(:user1)}
  let!(:friend2) {FactoryGirl.create(:user2)}
    it 'creates a friend request' do
      sign_in(friend1)
      visit users_path
      click_button "Friend Request"
      expect(page).to have_content("Friendship Pending")
      click_link "Sign out"

      sign_in(friend2)
      visit user_friendships_path(friend2)
      click_link "[Accept]"
      expect(page).to have_content("Friend request accepted")

    end
  end

end
