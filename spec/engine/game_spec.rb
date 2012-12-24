require 'spec_helper'

describe Game do
  let(:game)        { subject }
  let(:interpreter) { mock 'interpreter' }
  let(:executive)   { mock 'executive' }
  
  describe "#interpeter" do
    it "has one" do
      game.interpreter = interpreter
      game.interpreter.should == interpreter
    end
  end
  
  describe "#executive" do
    it "has one" do
      game.executive = executive
      game.executive.should == executive
    end
  end
  
end