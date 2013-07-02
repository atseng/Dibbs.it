require 'spec_helper'

describe 'User can upload an image for an item' do %q{

  As a user
  I want to be be able to upload an image
  So that my friends can see a picture of my item

  AC
  * I can upload an image

}

  describe 'Signed in User submits valid object' do
  let(:user) {FactoryGirl.create(:user)}
  let(:item) {FactoryGirl.build(:item)}
    it 'creates a valid item ' do
      sign_in(user)
      visit new_item_path(user)
      fill_in "Name", with: item.name
      attach_file_for_direct_upload("#{Rails.root}/spec/support/images/example.jpg")
      upload_directly(ImageUploader.new, "Upload Image")
      select(item.category, :from => "Category")
      fill_in "Description", with: item.description
      fill_in "Value", with: item.value
      click_button "Add Item"
      page.should have_content("New Work")
    end
  end











end
