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
    let(:item) do
      FactoryGirl.create(:item)
    end
  end






end

