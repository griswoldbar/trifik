shared_examples_for :actor do
  let(:room) { build(:room) }
  
  describe "attributes" do
    describe ":name" do
      it "has one" do
        actor.name = "Elvis"
        actor.name.should == "Elvis"
      end
    end
    
    describe ":description" do
      it "has one" do
        actor.description = "The King"
        actor.description.should == "The King"
      end
    end
  end

  describe "associations" do
    describe ":room" do
      it "has one" do
        actor.room = room
        actor.room.should resemble room
      end
    end
    
    describe ":items" do
      let(:rock)  { build(:item, id: :rock)}
      let(:paper) { build(:item, id: :paper)} 
      
      it "has them" do
        actor.items << rock
        actor.items << paper
        actor.items.should resemble([rock, paper])
      end
    end
  end
  
  describe "public methods" do
    describe "#zone" do
      it "returns its room's zone" do
        actor.room = room
        actor.zone.should == room.zone
      end
    end
    
    describe "#has_item?" do
      let(:item) { build(:item) }
      
      it "returns true if the actor has the item" do
        actor.items << item
        actor.should have_item item
      end
      
      it "returns false if the actor does not have the item" do
        actor.should_not have_item item
      end
    end
  end
end