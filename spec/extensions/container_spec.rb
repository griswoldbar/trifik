require 'spec_helper'

describe "Container" do
  let(:trif) { build(:trif) }
  
  describe "#items" do
    let(:rock)  { build(:item, id: :rock)}
    let(:paper) { build(:item, id: :paper)} 

    it "has them" do
      trif.extend(Container)
      trif.items << rock
      trif.items << paper
      trif.items.should resemble([rock, paper])
    end
  end

end