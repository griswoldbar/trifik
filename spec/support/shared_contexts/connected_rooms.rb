shared_context "connected rooms" do
  let(:kitchen_to_pantry) { build(:connection, direction: :west) }
  let(:pantry_to_kitchen) { build(:connection, direction: :east) }

  let(:kitchen)   { build(:room, name: "kitchen") }
  let(:pantry)    { build(:room, name: "pantry" ) }

  before(:each) do
    kitchen.exits << kitchen_to_pantry
    pantry.entrances << kitchen_to_pantry
    pantry.exits << pantry_to_kitchen
    kitchen.entrances << pantry_to_kitchen
  end
end