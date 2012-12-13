require 'spec_helper'

describe Ticker do
  let(:ticker) { subject }
  let(:watcher) { OpenStruct.new }
  
  describe ".new" do
    it "is initialized with an empty set of observers" do
      ticker.observers.should == []
    end
  end
  
  describe "#tick" do
    before { ticker.observers << watcher }
    it "notifies its observers" do
      watcher.should_receive :update
      ticker.tick
    end
    
    it "increments its counter" do
      expect { ticker.tick }.to change { ticker.ticks }.by 1
    end
  end

  
  
end