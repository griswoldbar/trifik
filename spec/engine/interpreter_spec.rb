require 'spec_helper'

describe Interpreter do
  let(:interpreter) { build(:interpreter) }
  let(:block)       { proc{ 'wibble' } }
  
  
  describe ".define" do
    it "evaluates the block given" do
      Interpreter.should_receive(:instance_eval).with(&block)
      Interpreter.define &block
    end
  end
  
  describe ".given" do
    it "creates a new instruction" do
      Interpreter.given(/blah/, &block)
      Interpreter.instructions.should include({regex: /blah/, command: block})
    end
  end
  
  describe "#interpret" do
    it "finds the right instruction and returns a command to be executed" do
      instruction = interpreter.interpret("kill elvis with hammer")
      instruction[:args].should == [:kill, :elvis, :hammer]
      instruction[:command].should be_instance_of Proc
    end
  end
  
end