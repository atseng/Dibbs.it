require 'spec_helper'

describe User do

  describe "properties" do
    context "email" do
      it { should validate_presence_of(:email) }
      it { should respond_to(:email) }
    end

    context "password" do
      it { should validate_presence_of(:password) }
      it { should respond_to(:password) }
    end

  end

end
