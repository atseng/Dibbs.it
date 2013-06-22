require 'spec_helper'

describe 'User can upload an object' do %q{

  As a user
  I want to be be able to upload an object
  So that my friends my request to borrow it

  AC
  * I can upload an object
  * I can specify the object name
  * I can specify object description
  * I can upload an image/avatar of the object
  * I can specify object value

}
  describe 'Signed in User submits valid object' do
  let(:user) {FactoryGirl.create(:user)}
    it 'creates a valid item ' do
      sign_in(user)
      item_count = Item.count
      visit new_item_path
      fill_in "Name", with: "SFX Lawnmower"
      fill_in "Description", with: "Steel blade high power. Stiff shifter."
      fill_in "Value", with: 120
      click_link "Add Item"
      expect(page).to have_content("Item created")
      expect(item_count + 1).to eq(Item.count)
    end
  end

  describe 'Signed in User submits invalid object' do
    let(:user) {FactoryGirl.create(:user)}
    it 'creates a invalid item ' do
      sign_in(user)
      item_count = Item.count
      visit new_item_path
      click_link "Add Item"
      expect(page).to have_content("can't be blank")
      expect(item_count).to eq(Item.count)
    end
  end

end
