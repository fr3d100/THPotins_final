require 'rails_helper'

RSpec.describe City, type: :model do

  before(:each) do 
  	@city = FactoryBot.create(:city)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@city).to be_a(City)
      expect(@city).to be_valid
    end

    it "should return a string" do
        expect(@city.name).to be_a(String)
    end

  end

 end