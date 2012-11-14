require 'spec_helper'

describe "Actor" do
  let(:actor) { build(:actor) }
  
  describe "attributes" do
    describe ":name" do
      it "has one" do
        actor.name = "Elvis"
        actor.name.should == "Elvis"
      end
    end
    
    describe ":description" do
      it "has one" do
        actor.description = "The King"
        actor.description.should == "The King"
      end
    end
  end

  describe "associations" do
    
  end
end