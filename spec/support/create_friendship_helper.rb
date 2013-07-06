module CreateFriendshipHelper

  def create_friendship(user, friend)
    sign_in(user)
      visit users_path
      click_button "Friend Request"
      expect(page).to have_content("Friendship Pending")
      click_link "Sign out"

      sign_in(friend)
      visit user_friendships_path(user)
      click_link "[Accept]"
      expect(page).to have_content("Friend request accepted")
  end
end
