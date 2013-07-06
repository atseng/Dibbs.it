require 'spec_helper'

describe 'User can upload an object' do %q{

  As a user
  I want to be be able to upload an object
  So that my friends my request to borrow it

  AC
  * I can upload an object
  * I can specify the object name
  * I can specify object description
  * I can specify object value

}
  describe 'Signed in User submits valid object' do
  let(:user) { FactoryGirl.create(:user) }
  let(:item) { FactoryGirl.build(:item) }
    it 'creates a valid item ' do
      sign_in(user)
      item_count = Item.count
      create_item(item)
      expect(page).to have_content("Item created")
      expect(item_count + 1).to eq(Item.count)
    end
  end

  describe 'Signed in User submits invalid object' do
    let(:user) { FactoryGirl.create(:user) }
    it 'creates a invalid item ' do
      sign_in(user)
      item_count = Item.count
      visit new_item_path(user)
      click_button "Add Item"
      expect(page).to have_content("can't be blank")
      expect(item_count).to eq(Item.count)
    end
  end

end
