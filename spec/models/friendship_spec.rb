require 'spec_helper'

describe Friendship do

  describe "associations" do
   it { should belong_to(:user) }
   it { should belong_to(:friend) }
   it { should respond_to(:friend_id)}
  end

  describe "properties" do
    context "user" do
      it { should validate_presence_of(:user)}
      it { should respond_to(:user_id)}
    end

    context "friend" do
      it { should validate_presence_of(:friend)}
      it { should respond_to(:friend_id)}
    end

    context "status" do
      it { should validate_presence_of(:status)}
      it { should respond_to(:status)}
    end
  end



end
