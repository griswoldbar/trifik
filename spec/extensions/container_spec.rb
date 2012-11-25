require 'spec_helper'

describe "Container" do
  let(:trif) { build(:trif) }
  
  describe "#items" do
    let(:rock)  { build(:item, id: :rock)}
    let(:paper) { build(:item, id: :paper)} 

    it "has them" do
      trif.modify(:container)
      trif.items << rock
      trif.items << paper
      trif.items.should resemble([rock, paper])
      trif.modifier_modules.should include(:container)
    end
  end

end