require 'spec_helper'

describe 'a user visting the welcome page' do %q{

  As a Visitor
  I want to be able to sign up
  So I can begin using Dibbs

  AC
  * Visitor can sign up
  * Visitor must provide a name
  * Visitor must provide an email
  * Visitor must provide a password
  * Visitor must confirm password

}

  describe 'visitor must sign in to use app' do
    it 'displays sign in as the welcome page' do
      visit users_path
      expect(page).to have_content('Sign in')
    end
  end

end
