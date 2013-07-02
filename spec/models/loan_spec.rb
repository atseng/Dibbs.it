require 'spec_helper'

describe Loan do

  describe "validations" do
    it { should validate_presence_of :borrower_id}
    it { should validate_presence_of :owner_id}
    it { should validate_presence_of :item_id}
    it { should validate_presence_of :state}
  end

  describe "associations" do
    context "user" do
      it { should belong_to(:item) }
      it { should belong_to(:owner) }
      it { should respond_to(:owner_id) }
      it { should belong_to(:borrower) }
      it { should respond_to(:borrower_id) }
    end
  end

  describe "loan" do
    it 'creates a loan for an item' do
      friendship = FactoryGirl.create(:friendship)
      user1 = friendship.user
      user2 = friendship.friend
      item = FactoryGirl.create(:item, user: user2)
      loan = FactoryGirl.create(:loan, owner: user2, borrower: user1)

      expect(loan).to_not be_nil
      expect(loan.state).to eq('loaned')
    end
  end







end
