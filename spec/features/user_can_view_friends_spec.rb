describe 'User can view their friends' do %q{

  As a User
  I be able to visit my friend's profile
  So I can call dibbs on their items for lending

  AC
  * User can see a friend's profile
  * User can see a friend's items


}

  describe "visiting a friend's profile" do
    let!(:friend1) { FactoryGirl.create(:user) }
    let!(:friend2) { FactoryGirl.create(:user) }
    it "views a friend's profile page" do
      create_friendship(friend1, friend2)
      visit user_friendships_path(friend)
      expect(page).to have_content(friend.name)
    end
  end












end
