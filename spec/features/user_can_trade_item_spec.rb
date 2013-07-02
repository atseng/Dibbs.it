
require 'spec_helper'

describe 'User can trade items' do %q{

  As a user
  I want to be able to trade items
  So that I get borrow cool items

  AC
  * I can start a item loan
  * I can't start a loan on a item already loaned

  }

  before (:each) do
    Loan.destroy_all
  end

  describe 'a user trades items' do
    let!(:friendship) { FactoryGirl.create(:friendship) }
    let!(:user) { friendship.user }
    let!(:friend) { friendship.friend }
    let!(:item) { FactoryGirl.create(:item, user: friend) }

    it 'user initiates a loan' do
      sign_in(user)
      visit user_items_path(friend)
      click_on item.name
      click_on "Dibbs"
      expect(page).to have_content "Dibbs"
    end
  end

  describe 'an item is already loaned' do
    let!(:friendship) { FactoryGirl.create(:friendship) }
    let!(:user) { friendship.user }
    let!(:friend) { friendship.friend }
    let!(:item) { FactoryGirl.create(:item, user: friend) }

    it 'displays a loaned status' do
      sign_in(user)
      visit user_items_path(friend)
      click_on item.name
      click_on "Dibbs"

      visit user_items_path(friend)
      click_on item.name
      expect(page).to have_content("Loaned")
    end
  end


end
