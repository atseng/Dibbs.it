
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
    click_on "Initiate Loan"
    expect(page).to have_content "Loan successfully created"

    # expect(page).to have_content("Skip it")
    # click_link "item"
    # click_link "request trade"
    # expect(page).to have_content("Item traded")
  end
end
