require 'spec_helper'

describe 'User can search for other users' do %q{

  As a user
  I want to be able to search for other users
  So that I can find my friends

  AC
  * I can search by name
  * I can search by email

}

  describe 'User searching for a friend' do
    let!(:user3) { FactoryGirl.create(:user, :name => "Shredder") }
    let!(:user2) { FactoryGirl.create(:user, :name => "Michaelango") }
    let(:user) { FactoryGirl.create(:user) }
    it 'creates a search by name query' do
      sign_in(user)
      visit users_path
      fill_in "User Name or Email", with: "Michaelango"
      click_button "Search"
      expect(page).to have_content(user2.name)
      save_and_open_page
      expect(page).to_not have_content(user3.name)
    end
  end


  describe 'User searching for a friend' do
    let!(:user3) { FactoryGirl.create(:user, :email => "shredder@nyc.com") }
    let!(:user2) { FactoryGirl.create(:user, :email => "leonardo@nyc.com") }
    let(:user) { FactoryGirl.create(:user) }
    it 'creates a search by email query' do
      sign_in(user)
      visit users_path
      fill_in "User Name or Email", with: "leonardo@nyc.com"
      click_button "Search"
      expect(page).to have_content(user2.email)
      expect(page).to_not have_content(user3.email)
    end
  end
end
