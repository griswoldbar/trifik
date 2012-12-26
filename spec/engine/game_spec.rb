require 'spec_helper'

class MockExecutive

  def say_hi(name)
    "hai yourself, #{name}"
  end
end

describe Game do
  let(:interpreter) { mock 'interpreter' }
  let(:executive)   { MockExecutive.new }
  let(:command)     { {
                        command: proc {|name| say_hi(name) }, args: ["johnny"]
                    } }
                    
  let(:game)        { Game.new(interpreter, executive) }

  describe "#play" do
    it "gets an input, inteprets, executes and outputs the result" do
      game.input_device.should_receive(:gets).and_return("hai johnny")
      game.interpreter.should_receive(:interpret).with("hai johnny").and_return(command)
      game.output_device.should_receive(:puts).with("hai yourself, johnny")
      game.play
    end
  end
  
end