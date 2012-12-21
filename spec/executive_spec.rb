require 'spec_helper'

describe Executive do
  let!(:player)    { build(:player) }
  let(:executive) { Executive.new(player) }
  let(:room)      { player.room }
  let(:object1)    { build(:item, container: player.room) }
  let(:object2)    { build(:item, container: player.room) }
  let(:actor1)    { build(:actor, room: player.room) }
  let(:actor2)    { build(:actor, room: player.room) }
  
  
  describe "#look" do
    
    it "describes the player's room" do
      expected_description = ["#{room.article.capitalize} #{room.name}.",
                              "#{room.description.capitalize}.",
                              "#{actor1.name.capitalize} is here.",
                              "#{actor2.name.capitalize} is here"].join("\n")
                              
      executive.look.should == expected_description
    end
  end
end