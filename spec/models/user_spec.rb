require 'spec_helper'

describe User do

  describe "associations" do
    it { should have_many(:items).dependent(:destroy) }
  end

  describe "validations" do
    context "name" do
      it { should validate_presence_of(:name) }
      it { should respond_to(:name) }
    end

    context "email" do
      it { should validate_presence_of(:email) }
      it { should respond_to(:email) }
    end

    context "password" do
      it { should validate_presence_of(:password) }
      it { should respond_to(:password) }
    end
  end

  describe "creating a new user" do
    it "will not be valid if name field is empty" do
      user = FactoryGirl.build(:user, name: nil)
      expect(user).to_not be_valid
    end

    it "will not be valid if email field is empty" do
      user = FactoryGirl.build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it "will not be valid if password field is empty" do
      user = FactoryGirl.build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it "will not work if the password confirmation is invalid" do
      user = FactoryGirl.build(:user, password_confirmation: 'baked beans')
      expect(user).to_not be_valid
    end

    it "should accept name, email, password, password confirmation" do
      user_count = User.all.count
      user = FactoryGirl.create(:user)
      expect(User.all.count).to eql(user_count+1)
    end
  end



end
