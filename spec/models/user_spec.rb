require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
  	@user = FactoryBot.create(:user)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    it "should return a string" do
        expect(@user.first_name).to be_a(String)
    end

  end

 end