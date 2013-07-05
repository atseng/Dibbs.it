require 'spec_helper'

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
      visit user_friendships_path(friend1)
      click_link friend1.name
      expect(page).to have_content(friend1.name)
    end
  end

  describe " a friend's profile" do
    let!(:friend1) { FactoryGirl.create(:user) }
    let!(:friend2) { FactoryGirl.create(:user) }
    let!(:item) { FactoryGirl.create_list(:item, 3, user: friend1) }
    it 'shows a list of available items' do
      create_friendship(friend1, friend2)
      visit user_friendships_path(friend1)
      click_link friend1.name
      save_and_open_page
      expect(friend1.items.count).to eq(3)
    end
  end











end
