require 'spec_helper'

describe "Room" do
  let(:room) { build(:room) }
  
  describe "attributes" do
    
    describe ":name" do
      it "has one" do
        room.name = "thingy"
        room.name.should == "thingy"
      end
    end
    
    describe ":description" do
      it "has one" do
        room.description = "an awesome thingy"
        room.description.should == "an awesome thingy"
      end
    end
    
  end
  
  describe "associations" do
    describe ":items" do
      let(:rock)  { build(:item, id: :rock)}
      let(:paper) { build(:item, id: :paper)} 
      
      it "has them" do
        room.items << rock
        room.items << paper
        room.items.should resemble([rock, paper])
      end
    end
    
    describe ":entrances" do
      let(:entrance1) { build(:connection) }
      let(:entrance2) { build(:connection) }
      
      it "has them" do
        room.exits << entrance1
        room.exits << entrance2
        room.exits.should resemble([entrance1,entrance2])
      end
    end
    
    describe ":exits" do
      let(:exit1) { build(:connection) }
      let(:exit2) { build(:connection) }
      
      it "has them" do
        room.exits << exit1
        room.exits << exit2
        room.exits.should resemble([exit1,exit2])
      end
    end
    
  end
  
end