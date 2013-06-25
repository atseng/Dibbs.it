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
  let(:user) {FactoryGirl.create(:user)}
    it 'creates a friend request' do
      sign_in(user)
      visit users_path
      click_button "Friend Request"
      expect(page).to have_content("Friendship Pending")
    end
  end

  describe 'User cannot friend themself' do
  let(:user) {FactoryGirl.create(:user)}
    it'prevents user from creating a friend request' do
      sign_in(user)
      visit user_friendships_path(user)
      click_button "Accept"
      expect(page).to have_content("New Friend")
    end
  end





end
