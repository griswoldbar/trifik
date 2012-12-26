require 'spec_helper'

describe "Take" do
  let(:item)   { build(:item).tap {|t| t.extend(Take) } }
  let(:player) { build(:player) }
  
  before(:each) do
    item.stub(:take_message).and_return("plop")
    item.stub(:not_present_message).and_return("that isn't here")
  end
  
  describe "#take" do
    it "takes the item when the player does not have it and it is takeable" do
      item.container = player.room
      item.take(player).should == "plop"
      player.items.should include(item)
      item.container.should resemble player
    end
    
    it "returns an appropriate message when the player does not have it" do
      player.items.should_not include(item)
      item.take(player).should == "that isn't here"
    end
  end
end