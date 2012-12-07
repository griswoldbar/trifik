shared_context "connected rooms" do
  let(:kitchen_to_pantry) { build(:connection, direction: :west) }
  let(:pantry_to_kitchen) { build(:connection, direction: :east) }
  let(:kitchen_to_dining_room) { build(:connection, direction: :north) }
  let(:dining_room_to_kitchen) { build(:connection, direction: :south) }
  let(:pantry_to_dining_room)  { build(:connection, direction: :northeast) }
  let(:dining_room_to_pantry)  { build(:connection, direction: :southwest) }
  
  let(:kitchen)   { build(:room, name: "kitchen") }
  let(:pantry)    { build(:room, name: "pantry" ) }
  let(:dining_room) { build(:room, name: "dining room") }

  before(:each) do
    kitchen.exits << kitchen_to_pantry
    kitchen.exits << kitchen_to_dining_room
    kitchen.entrances << pantry_to_kitchen
    kitchen.entrances << dining_room_to_kitchen
    
    pantry.entrances << kitchen_to_pantry
    pantry.entrances << dining_room_to_pantry
    pantry.exits << pantry_to_kitchen
    pantry.exits << pantry_to_dining_room
    
    dining_room.entrances << kitchen_to_dining_room
    dining_room.entrances << pantry_to_dining_room
    dining_room.exits << dining_room_to_pantry
    dining_room.exits << dining_room_to_kitchen
  end
end