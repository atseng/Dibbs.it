require 'spec_helper'

describe 'User can upload an image for an item' do %q{

  As a user
  I want to be be able to upload an image
  So that my friends can see a picture of my item

  AC
  * I can upload an image file

}

  describe 'Signed in User submits valid object' do
  let(:user) {FactoryGirl.create(:user)}
  let(:item) {FactoryGirl.build(:item)}
    it 'uploads an image for a valid item ' do
      sign_in(user)
      visit new_item_path(user)
      fill_in "Name", with: item.name
      attach_file('item_avatar', "#{Rails.root}/spec/support/example.jpg")
      select(item.category, :from => "Category")
      fill_in "Description", with: item.description
      fill_in "Value", with: item.value
      click_button "Add Item"
      expect(page).to have_content(item.avatar)
      expect("/uploads/item/avatar/" + item.id.to_s + "/test.jpg").to be_present
    end
  end











end
