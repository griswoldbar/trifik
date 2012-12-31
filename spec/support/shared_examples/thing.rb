shared_examples_for :thing do
  
  it_behaves_like :model do
    let(:model) { thing }
  end
  
  describe "#screen_name" do
    it "returns the screen name if there is one" do
      thing.record.stub(:screen_name).and_return("wibble")
      thing.screen_name.should == "wibble"
    end
    
    it "returns the name if there isn't one" do
      thing.screen_name.should == thing.name
    end
  end
  
  describe "#article" do
    it "defaults to ''" do
      thing.article.should == ""
    end
  end
  
  describe "#article_name" do
    it "concatenates the article with the name" do
      thing.stub(:article).and_return("the")
      thing.article_name.should == "the #{thing.name}"
    end
    
    it "returns the name if there is no article" do
      thing.stub(:article).and_return("")
      thing.article_name.should == thing.name
    end
  end
end