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
    it 'Valid user sends a friend request' do
      visit user_show_path
      click_button "Friend"
    end
  end





end
