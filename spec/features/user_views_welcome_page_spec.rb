require 'spec_helper'

describe 'a user visting the welcome page' do %q{

  As a Visitor
  I want to be able to sign up
  So I can begin using Dibbs

  AC
  * Visitor can sign up
  * Visitor must provide an email
  * Visitor must provide a password
  * Visitor must confirm password
  * Valid User can sign in

}

  describe 'visitor must sign in to use app' do
    it 'displays sign in as the welcome page' do
      visit users_path
      expect(page).to have_button('Sign in')
    end
  end

  describe 'visitor can sign up ' do
    it 'displays sign up for visitors who are not valid users' do
      visit users_path
      expect(page).to have_link('Sign up now')
    end
  end

  describe 'visitor can register as new user' do
    let(:user) {FactoryGirl.build(:user)}
    it 'creates a valid user' do
      visit new_user_registration_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password_confirmation
      click_button "Sign up"
      expect(page).to have_content("Welcome! You have signed up successfully.")
    end
  end

  describe 'vistor creating an invalid new user' do
    it 'creates a invalid user' do
      visit new_user_registration_path
      click_button "Sign up"
      expect(page).to have_content("can't be blank")
    end
  end

  describe 'valid user sign in' do
    let(:user) {FactoryGirl.create(:user)}
    it 'signs in a valid user' do
      visit users_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
      expect(page).to have_content("Signed in successfully.")
      save_and_open_page
      expect(page).to have_content("My Items")
    end
  end

end
