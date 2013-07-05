require 'spec_helper'

describe 'User can edit an item' do %q{

  As a user
  I want to be update an item
  So that I can list important changes

  AC
  * I can edit the item name
  * I can edit the item picture
  * I can edit the item activity
  * I can edit the item category
  * I can edit the item description
  * I can edit the item value
  * I can delete an item

}

  describe 'User can edit valid item' do
  let(:user) { FactoryGirl.create(:user) }
  let(:item) { FactoryGirl.create(:item) }
    it 'updates a valid item name properties' do
     sign_in(user)
     create_item(item)
     click_link item.name
     fill_in 'Name', with: "Double Skip it"
     fill_in 'Description', with: "Most awesome 90s toy ever."
     click_button 'Edit Item'
     expect(page).to have_content("Successfully updated item.")
     expect(page).to have_content("Most awesome 90s toy ever.")
    end
  end

  describe 'User can delete valid item' do
  let(:user) { FactoryGirl.create(:user) }
  let(:item) { FactoryGirl.create(:item) }
    it 'deletes a item' do
     sign_in(user)
     item_count = Item.count
     create_item(item)
     first(:link, "Destroy").click
     expect(item_count).to eq(Item.count - 1)
     expect(page).to have_content("Successfully deleted item.")
    end
  end
end
