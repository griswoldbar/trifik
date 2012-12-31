require 'spec_helper'

describe "Item" do
  let(:item) { build(:item) }

  it_behaves_like(:thing) do
    let(:thing) {build(:item)}
  end
  
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

  describe "public methods" do
    describe "#zone" do
      let(:holder) { build(:trif).tap{|t| t.add_modifier(:container)} }
      
      it "returns its container's zone" do
        holder.stub(:zone).and_return(mock 'zone')
        item.container = holder
        item.zone.should == holder.zone
      end
    end
  end  
end