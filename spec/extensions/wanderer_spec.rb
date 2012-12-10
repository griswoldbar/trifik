require 'spec_helper'

describe Wanderer do
  include_context "connected rooms"
  
  let(:wanderer) { build(:actor).tap {|a| a.add_modifier(:wanderer)} }
  
  describe "#walk" do
    it "moves the thing into an adjacent room" do
      wanderer.room = kitchen
      [pantry.id, dining_room.id].should include(wanderer.tap(&:walk).room.id)
    end
  end
  
  
end
