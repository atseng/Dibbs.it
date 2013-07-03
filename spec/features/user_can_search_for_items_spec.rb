require 'spec_helper'

describe 'User can search for items' do %q{

  As a user
  I want to be able to search for items
  So that I find items i am looking for

  AC
  * I can search by name
  * I can search by category
  * I can search by newest

}

  describe 'User creates a search query' do
  let(:user) {FactoryGirl.create(:user)}
  let(:item) {FactoryGirl.build(:item)}
    it 'searches by item name' do
      sign_in(user)
      visit search_path
      expect(page).to have_content()
    end
  end

end