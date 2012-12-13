require 'spec_helper'

describe Wanderer do
  include_context "connected rooms"
  
  let!(:wanderer) { build(:actor).tap{|a| a.add_modifier(:wanderer)} }
  
  it_behaves_like :tickable do
    let(:tickable) { build(:actor).tap{|a| a.add_modifier(:wanderer)} }
  end
  
  describe "#tock" do
    it "moves the thing into an adjacent room" do
      wanderer.room = kitchen
      wanderer.stub(:zone).and_return kitchen.zone
      [pantry.id, dining_room.id].should include(wanderer.tap(&:tock).room.id)
    end
  end
    
  
end
