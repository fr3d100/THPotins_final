require 'rails_helper'

RSpec.describe PrivateMessage, type: :model do

  before(:each) do 
  	@pm = FactoryBot.create(:private_message)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@pm).to be_a(PrivateMessage)
      expect(@pm).to be_valid
    end

    it "should return a string" do
        expect(@pm.content).to be_a(String)
    end

  end

 end