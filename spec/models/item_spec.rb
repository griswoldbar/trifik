require 'spec_helper'

describe "Item" do
  let(:item) { build(:item) }
  
  describe "attributes" do
    
    describe ":name" do
      it "has one" do
        item.name = "thingy"
        item.name.should == "thingy"
      end
    end
    
    describe ":description" do
      it "has one" do
        item.description = "an awesome thingy"
        item.description.should == "an awesome thingy"
      end
    end
    
  end
  
  describe "associations" do
    describe ":container" do
      let(:holder) { build(:trif) }
      
      before { holder.add_modifier(:container) }
      
      it "has one" do
        item.container = holder
        item.container.should resemble holder
      end
    end
  end
  
end