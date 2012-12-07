require 'spec_helper'

describe "Mover" do
  include_context "connected rooms"
  
  let(:trif) { build(:actor) }
  
  
  describe "#move" do
    before do
      trif.add_modifier(:mover)
      trif.room = kitchen
    end
    
    it "can move" do
      trif.room.should resemble kitchen
      trif.move(:west)
      trif.room.should resemble pantry
      # trif.move(:east)
      # trif.room.should resemble kitchen
    end
    
    it "doesn't move given an invalid direction" do
      trif.room.should resemble kitchen
      trif.move(:east)
      trif.room.should resemble kitchen
    end
  end

end