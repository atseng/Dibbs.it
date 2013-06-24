require 'spec_helper'

describe Item do

  describe "associations" do
   it { should belong_to(:user) }
   it { should respond_to(:user_id) }
  end

  describe "properties" do
    context "name" do
      it {should validate_presence_of(:name)}
      it {should respond_to(:name)}
    end

    context "description" do
      it {should validate_presence_of(:description)}
      it {should respond_to(:description)}
    end

    context "value" do
      it {should validate_presence_of(:value)}
      it {should respond_to(:value)}
    end

  end


  describe 'creating an item' do
    it "will not be valid if name field is empty" do
      item = FactoryGirl.build(:item, name: nil)
      expect(item).to_not be_valid
    end

    it "will not be valid if description field is empty" do
      item = FactoryGirl.build(:item, description: nil)
      expect(item).to_not be_valid
    end

    it "will not be valid if value field is empty" do
      item = FactoryGirl.build(:item, value: nil)
      expect(item).to_not be_valid
    end

    it "should accept name, description, value" do
      item_count = Item.all.count
      item = FactoryGirl.create(:item)
      expect(Item.all.count).to eql(item_count+1)
    end

  end

end

