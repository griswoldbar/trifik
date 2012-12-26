require 'spec_helper'

describe "Container" do
  let(:trif) { build(:trif).tap{|t| t.add_modifier(:container)} }
  
  describe "#items" do
    let(:rock)  { build(:item, id: :rock)}
    let(:paper) { build(:item, id: :paper)} 

    it "has them" do
      trif.items << rock
      trif.items << paper
      trif.items.should resemble([rock, paper])
      trif.modifier_modules.should include(:container)
    end
  end
  
  describe "#has_item?" do
    let(:item) { build(:item) }
    
    it "returns true if the trif has the item" do
      trif.items << item
      trif.should have_item item
    end
    
    it "returns false if the trif does not have the item" do
      trif.should_not have_item item
    end
  end

end