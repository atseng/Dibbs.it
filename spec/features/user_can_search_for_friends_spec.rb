require 'spec_helper'

describe 'User can search for other users' do %q{

  As a user
  I want to be able to search for other users
  So that I can choose my friends

  AC
  * I can search by name
  * I can search by email

}

  describe 'User searching for a friend' do
    it 'creates a search by name query' do
      sign_in(user)
      visit user_index_path

    end
  end

end
