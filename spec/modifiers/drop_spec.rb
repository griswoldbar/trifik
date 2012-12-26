require 'spec_helper'

describe "Drop" do
  let(:item) { build(:item).tap {|t| t.extend(Drop) } }
  let(:player) { build(:player) }
  let(:drop_message) { }
  
  before(:each) do
    item.stub(:drop_message).and_return("plop")
    item.stub(:not_possessed_message).and_return("you ain't got it")
  end
  
  describe "#drop" do
    it "drops the item when the player has it" do
      player.items << item
      item.drop(player).should == "plop"
      player.items.should_not include(item)
      item.container.should resemble player.room
    end
    
    it "returns an appropriate message when the player does not have it" do
      player.items.should_not include(item)
      item.drop(player).should == "you ain't got it"
    end
  end
  
end