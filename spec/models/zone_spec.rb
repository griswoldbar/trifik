require 'spec_helper'

describe Zone do
  let(:zone) { build(:zone) }
  
  describe "associations" do
    describe ":rooms" do
      let(:room1) { build(:room) }
      let(:room2) { build(:room) }
      
      it "has them" do
        zone.rooms << room1
        zone.rooms << room2
        zone.rooms.should resemble [room1, room2]
      end
    end
  end
  
  describe "public methods" do
    describe "#ticker" do
      let(:ticker) { mock 'ticker' }
      it "returns the record's ticker if it has one" do
        zone.record.ticker = ticker
        zone.ticker.should == ticker
      end
      
      it "defines a new ticker if it does not have one" do
        Ticker.should_receive(:new).and_return ticker
        zone.ticker.should == ticker
        zone.record.ticker.should == ticker
      end
      
    end
  end

end