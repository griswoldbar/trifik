shared_examples_for :actor do
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
      let(:room) { build(:room) }
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
end