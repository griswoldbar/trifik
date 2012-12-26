class Game
  
  attr_reader :interpreter, :executive, :input_device, :output_device
  
  def initialize(interpreter, executive, input_device=STDIN, output_device=STDOUT)
    @interpreter = interpreter
    @executive = executive
    @input_device = input_device
    @output_device = output_device
  end
  
  def play
    input = input_device.gets
    command = interpreter.interpret(input)
    instruction = command[:command]
    args = command[:args]
    output = executive.instance_exec(*args, &instruction)
    output_device.puts output
  end
  
end