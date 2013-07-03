require 'spec_helper'

'User can view items' do %q{

  As a user
  I want to be able to view items
  So I can see what's on the app

  * I can see my items

}

 describe "viewing my items" do
  let(:user) {FactoryGirl.create(:user)}
  let(:item) {FactoryGirl.create(:item)}
    it "should display a list of valid items" do
      sign_in(user)
      create_item(item)
      expect(page).to have_content("Skip it")
    end
  end









end
