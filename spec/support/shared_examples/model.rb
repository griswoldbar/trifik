shared_examples_for :model do
  let(:zone) { build(:zone) }
  
  describe "#ticker" do
    before(:each) do
      model.stub(:zone).and_return(zone)
    end
    
    it "delegates to its zone" do
      model.ticker.should == zone.ticker
    end
  end
  
end