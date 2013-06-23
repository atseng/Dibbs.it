require 'spec_helper'

describe 'User can edit an object' do %q{

  As a user
  I want to be update an object
  So that I can list important changes

  AC
  * I can edit the object name
  * I can edit the object description
  * I can edit the object value
  * I can delete an object

}
  before (:each) do
    Item.destroy_all
  end

  describe 'User can edit valid object' do
  let(:user) {FactoryGirl.create(:user)}
  let(:item) {FactoryGirl.create(:item)}
    it 'updates a valid item properties' do
     sign_in(user)
     create_item(item)
     first(:link, "Edit").click
     fill_in 'Description', with: "Most awesome 90s toy ever."
     click_button 'Submit'
     expect(page).to have_content("Item updated")
    end
  end

  describe 'User can delete valid object' do
  let(:user) {FactoryGirl.create(:user)}
  let(:item) {FactoryGirl.create(:item)}
    it 'deletes a item' do
     sign_in(user)
     item_count = Item.count
     create_item(item)
     first(:link, "Destroy").click
     expect(item_count).to eq(Item.count)
    end
  end





















end
