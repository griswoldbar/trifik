shared_examples_for :tickable do

  it "tocks when the ticker ticks" do
    tickable.class.should_receive(:instantiate).with(tickable.record).and_return(tickable)
    tickable.should_receive(:tock)
    tickable.ticker.tick
  end
  
end