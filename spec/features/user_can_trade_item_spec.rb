
require 'spec_helper'

describe 'a user trades items' do
let(:user) {FactoryGirl.create(:user)}
  it 'marks a item has unavailable' do
    sign_in(user)
    visit user_friendships_path(user)
    click_link "friend"
    expect(page).to have_content("Skip it")
    click_link "item"
    click_link "request trade"
    expect(page).to have_content("Item traded")
  end


end
