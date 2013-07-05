require 'spec_helper'

describe 'User can search for items' do %q{

  As a user
  I want to be able to search for items
  So that I find items i am looking for

  AC
  * I can search by name
  * I can search by activity
  * I can search by category

}

  describe 'User creates a search query' do
  let!(:friendship) { FactoryGirl.create(:friendship) }
  let!(:user) { friendship.user }
  let!(:friend) { friendship.friend }
  let!(:item) { FactoryGirl.create(:item, user: friend) }
  let!(:item2) { FactoryGirl.create(:item, user: friend, name: "Slip n Slide") }
    it 'searches by item name' do
      sign_in(user)
      visit search_path
      fill_in "Item Name, Activity, or Category", with: "Slip n Slide"
      click_button "Search"
      expect(page).to have_content(item2.name)
      expect(page).to_not have_content(item.name)
    end
  end

  describe 'User creates a search query' do
  let!(:friendship) { FactoryGirl.create(:friendship) }
  let!(:user) { friendship.user }
  let!(:friend) { friendship.friend }
  let!(:item) { FactoryGirl.create(:item, user: friend) }
  let!(:item2) { FactoryGirl.create(:item, user: friend, activity: "Cookout") }
    it 'searches by activity' do
      sign_in(user)
      visit search_path
      fill_in "Item Name, Activity, or Category", with: "Cookout"
      click_button "Search"
      expect(page).to have_content(item2.activity)
      expect(page).to_not have_content(item.activity)
    end
  end

  describe 'User creates a search query' do
  let!(:friendship) { FactoryGirl.create(:friendship) }
  let!(:user) { friendship.user }
  let!(:friend) { friendship.friend }
  let!(:item) { FactoryGirl.create(:item, user: friend) }
  let!(:item2) { FactoryGirl.create(:item, user: friend, category: "Sports") }
    it 'searches by cateogry of item' do
      sign_in(user)
      visit search_path
      fill_in "Item Name, Activity, or Category", with: "Sports"
      click_button "Search"
      expect(page).to have_content(item2.category)
      expect(page).to_not have_content(item.category)
    end
  end

end
