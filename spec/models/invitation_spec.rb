require 'spec_helper'

describe Invitation do
   describe "associations" do
    context "user" do
     it { should belong_to(:sender) }
     it { should respond_to(:sender_id) }
    end
  end

  describe "validations" do
    context 'recipient email' do
      it { should validate_presence_of(:recipient_email) }
    end
  end

end
