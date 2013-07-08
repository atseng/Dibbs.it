require 'spec_helper'

describe 'User can view items' do %q{

  As a user
  I want to be able to view items
  So I can see what's on the app

  * I can see my items
  * I can see my loaned items
  * I can request a return

}

 describe "viewing my items" do
  let(:user) { FactoryGirl.create(:user) }
  let(:item) { FactoryGirl.create(:item) }
    it "should display the user's valid item" do
      sign_in(user)
      create_item(item)
      expect(page).to have_content("Skip it")
    end
  end

  describe "viewing my item requests" do
    let!(:user) { FactoryGirl.create(:user1) }
    let!(:friendship) { FactoryGirl.create(:friendship, user: user, friend: friend ) }
    let!(:friend) { FactoryGirl.create(:user2) }
    let!(:item) { FactoryGirl.create(:item, user: user) }
    it "should display the user's pending dibbs requests" do
      sign_in(friend)
      visit user_items_path(user)
      click_link item.name
      click_on "Dibbs"
      click_on "Sign out"

      sign_in(user)
      expect(page).to have_button("Lend it!")
    end
  end

  describe 'viewing my loaned items' do
    let!(:user) { FactoryGirl.create(:user1) }
    let!(:friendship) { FactoryGirl.create(:friendship, user: user, friend: friend ) }
    let!(:friend) { FactoryGirl.create(:user2) }
    let!(:item) { FactoryGirl.create(:item, user: user) }
    it "should display the user's pending dibbs requests" do
      sign_in(friend)
      visit user_items_path(user)
      click_link item.name
      click_on "Dibbs"
      click_on "Sign out"

      sign_in(user)
      click_button "Lend it!"
      expect(page).to have_button("Return it!")
    end
  end

  describe 'request a return on an item' do
    let!(:user) { FactoryGirl.create(:user1) }
    let!(:friendship) { FactoryGirl.create(:friendship, user: user, friend: friend ) }
    let!(:friend) { FactoryGirl.create(:user2) }
    let!(:item) { FactoryGirl.create(:item, user: user) }
    it "should display the user's pending dibbs requests" do
      sign_in(friend)
      visit user_items_path(user)
      click_link item.name
      click_on "Dibbs"
      click_on "Sign out"

      sign_in(user)
      click_button "Lend it!"
      click_button "Return it!"
      expect(page).to have_content("Loan updated")
    end
  end


end
