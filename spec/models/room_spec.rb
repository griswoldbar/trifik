require 'spec_helper'

describe "Room" do
  let(:room) { build(:room) }
  
  it_behaves_like(:model) do
    let(:model) {build(:room)}
  end
  
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
    
    describe ":zone" do
      let(:zone) { build(:zone) }
      it "has one" do
        room.zone = zone
        room.zone.should resemble zone
      end
    end  
  end
  
  describe "direction readers" do
    include_context "connected rooms"
    
    it "points to the appropriate room" do
      kitchen.west.should resemble pantry
      pantry.east.should resemble kitchen
    end
    
    it "returns nil if there is nothing in that direction" do
      kitchen.southeast.should == nil
    end
    
    describe "#directions" do
      it "returns all the directions possible from the room" do
        kitchen.directions.should == [:west, :north]
        pantry.directions.should == [:east, :northeast]
      end
    end
    
    describe "#has_direction?" do
      it "returns true/false depending on whether there is an adjacent room in the given direction" do
        kitchen.has_direction?(:west).should be_true
        pantry.has_direction?(:west).should be_false
      end
    end
    
    describe "#adjacents" do
      it "returns the adjacent rooms" do
        kitchen.adjacents.should resemble [pantry, dining_room]
      end
    end
    
    describe "#adjacent" do
      it "returns the adjacent room" do
        kitchen.adjacent(:west).should resemble pantry
        pantry.adjacent(:east).should resemble kitchen
      end
    end
  end

  describe "public methods" do
    describe "#title" do
      it "returns the article and name" do
        room.title.should == "#{room.article} #{room.name}".strip.capitalize
      end
    end
  end
end