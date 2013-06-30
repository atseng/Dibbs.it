
require 'spec_helper'

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
    expect(page).to have_content "Borrow Item"
  end
end
