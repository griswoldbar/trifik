require 'spec_helper'

describe "Connection" do
  let(:connection) { build(:connection) }
  
  describe "attributes" do
    describe ":description" do
      it "has one" do
        connection.description = "A big door"
        connection.description.should == "A big door"
      end
    end
    
    describe ":direction" do
      it "has one" do
        connection.direction = :west
        connection.direction.should == :west
      end
    end
  end
  
  describe "associations" do
    
    describe ":exit" do
      let(:room) { build(:room) }
      it "has one" do
        connection.exit = room
        connection.exit.should resemble room
      end
    end
    
    describe ":entrance" do
      let(:room) { build(:room) }
      it "has one" do
        connection.entrance = room
        connection.entrance.should resemble room
      end
    end
  end
  
end