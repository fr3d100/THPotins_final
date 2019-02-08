require 'rails_helper'

RSpec.describe Tag, type: :model do

  before(:each) do 
  	@tag = FactoryBot.create(:tag)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@tag).to be_a(Tag)
      expect(@tag).to be_valid
    end

    it "should return a string" do
        expect(@tag.title).to be_a(String)
    end
    
  end

 end