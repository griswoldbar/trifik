require 'spec_helper'

describe Wanderer do
  include_context "connected rooms"
  
  let(:wanderer) { build(:actor) }
  
  before(:each) do
    wanderer.room = kitchen
    wanderer.add_modifier(:wanderer)
  end
  describe "#walk" do
    it "moves the thing into an adjacent room" do
      [pantry.id, dining_room.id].should include(wanderer.tap(&:walk).room.id)
    end
  end
  
  
end
