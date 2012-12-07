require 'spec_helper'

describe "Mover" do
  let(:kitchen_to_pantry) { build(:connection, direction: :west) }
  let(:pantry_to_kitchen) { build(:connection, direction: :east) }
  
  let(:kitchen)   { build(:room) }
  let(:pantry)    { build(:room) }
  
  let(:trif) { build(:trif) }
  
  describe "#items" do
    let(:rock)  { build(:item, id: :rock)}
    let(:paper) { build(:item, id: :paper)} 

    it "has them" do
      trif.add_modifier(:container)
      trif.items << rock
      trif.items << paper
      trif.items.should resemble([rock, paper])
      trif.modifier_modules.should include(:container)
    end
  end

end