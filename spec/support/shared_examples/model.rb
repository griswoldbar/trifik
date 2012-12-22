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
  
  describe "#screen_name" do
    it "returns the screen name if there is one" do
      model.record.stub(:screen_name).and_return("wibble")
      model.screen_name.should == "wibble"
    end
    
    it "returns the name if there isn't one" do
      model.screen_name.should == model.name
    end
  end
  
  describe "#article" do
    it "defaults to ''" do
      model.article.should == ""
    end
  end
  
  describe "#article_name" do
    it "concatenates the article with the name" do
      model.stub(:article).and_return("the")
      model.article_name.should == "the #{model.name}"
    end
    
    it "returns the name if there is no article" do
      model.stub(:article).and_return("")
      model.article_name.should == model.name
    end
  end
end