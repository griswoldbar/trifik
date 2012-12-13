require 'spec_helper'

describe Patroller do
  include_context "connected rooms"
  
  let!(:patroller) { build(:actor).tap{|a| a.add_modifier(:patroller)} }
  
  it_behaves_like :tickable do
    let(:tickable) { build(:actor).tap{|a| a.add_modifier(:patroller)} }
  end
  
  describe "#tock" do
    before(:each) do
      patroller.modifiers.patroller.path = [kitchen.id,pantry.id,kitchen.id,kitchen.id,dining_room.id]
    end
    
    it "moves the thing into the next room in the sequence" do
      patroller.room = kitchen
      patroller.stub(:zone).and_return kitchen.zone
      
      path = [pantry.id,kitchen.id,kitchen.id,dining_room.id, kitchen.id]
      path.each do |room_id|
        patroller.tock
        patroller.room.id.should == room_id
      end
      
    end
  end
    
  
end
