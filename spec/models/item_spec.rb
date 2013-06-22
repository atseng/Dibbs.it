require 'spec_helper'

describe Item do
  context "name" do
    it {should validate_presence_of(:name)}
  end

  context "description" do
    it {should validate_presence_of(:description)}
  end

  context "value" do
    it {should validate_presence_of(:value)}
  end
end
