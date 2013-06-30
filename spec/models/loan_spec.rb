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
    end
  end














end
