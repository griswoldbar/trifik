require 'spec_helper'

describe Executive do
  let!(:player)    { build(:player) }
  let(:executive) { build(:executive, player: player) }
  let(:room)      { player.room }
  let(:object1)    { build(:item, container: player.room) }
  let(:object2)    { build(:item, container: player.room) }
  let(:actor1)    { build(:actor, room: player.room) }
  let(:actor2)    { build(:actor, room: player.room) }
  
  
  describe "#look" do
    
    it "describes the player's room" do
      expected_description = ["#{room.article.capitalize} #{room.name}",
                              "#{room.description}.",
                              "#{actor1.article_name.titleize} is here.",
                              "#{actor2.article_name.titleize} is here.",
                              "There is:",
                              object1.article_name,
                              object2.article_name].join("\n")
                              
      executive.look.should == expected_description
    end
  end
  
  describe "#execute" do
    it "runs a method on itself if no nouns are given" do
      executive.should_receive(:blah)
      executive.execute(:blah)
    end
    
    it "runs a method on the subject if one is given" do
      object1.should_receive(:blah).with(player)
      executive.execute(:blah, object1)
    end
    
    it "runs a method on the subject with the object as argument if supplied" do
      actor1.should_receive(:blah).with(player, object1)
      executive.execute(:blah, actor1, object1)
    end
  end
  
  describe "directions" do
    it "sends the player in the corresponding direction" do
      Trifik::DIRECTIONS.each {|dir|
        player.should_receive(:move).with(dir)
        executive.send(dir)
      }
    end
  end
end