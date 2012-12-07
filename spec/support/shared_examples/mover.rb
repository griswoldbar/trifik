shared_examples_for(:mover) do
  include_context "connected rooms"
  describe "#move" do
    before do
      mover.add_modifier(:mover)
      mover.room = kitchen
    end
    
    it "can move" do
      mover.room.should resemble kitchen
      mover.move(:west)
      mover.room.should resemble pantry
      mover.move(:east)
      mover.room.should resemble kitchen
    end
    
    it "doesn't move given an invalid direction" do
      mover.room.should resemble kitchen
      mover.move(:east)
      mover.room.should resemble kitchen
    end
  end
end