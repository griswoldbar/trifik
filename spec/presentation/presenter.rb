require 'spec_helper'

describe "Presenter" do
  
  describe "#header" do
    it "outputs an appropriate header" do
      Presenter.header("blah").should == "======\n blah\n======"
    end
  end
end