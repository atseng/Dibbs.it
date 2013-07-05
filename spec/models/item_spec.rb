require 'spec_helper'

describe Item do

  describe "associations" do
    context "user" do
     it { should belong_to(:user) }
     it { should respond_to(:user_id) }
   end

    context "loan" do
      it { should have_many(:loans).dependent(:destroy) }
    end
  end

  describe "properties" do
    context "name" do
      it { should validate_presence_of(:name) }
      it { should respond_to(:name) }
    end

    context "category" do
      it { should validate_presence_of(:category) }
      it { should respond_to(:category) }
    end

    context "description" do
      it { should validate_presence_of(:description) }
      it { should respond_to(:description) }
    end

    context "activity" do
      it { should validate_presence_of(:activity) }
      it { should respond_to(:activity) }
    end

  end


  describe 'creating an item' do
    it "will not be valid if name field is empty" do
      item = FactoryGirl.build(:item, name: nil)
      expect(item).to_not be_valid
    end

    it "will not be valid if description field is empty" do
      item = FactoryGirl.build(:item, category: nil)
      expect(item).to_not be_valid
    end

    it "will not be valid if activity field is empty" do
      item = FactoryGirl.build(:item, activity: nil)
      expect(item).to_not be_valid
    end

    it "should accept name, activity, category " do
      item_count = Item.all.count
      item = FactoryGirl.create(:item)
      expect(Item.all.count).to eql(item_count+1)
    end

  end

end

