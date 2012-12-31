class Game
  #let's have a formatter class to decide how the output should be displayed (header etc)
  #also, we could cache the last command here so that we can do things like "kill bob / what
  #do you want to kill bob with/ the knife/" also, this will make dialogue easier.
  
  attr_reader :interpreter, :executive, :input_device, :output_device
  
  def initialize(interpreter, executive, input_device=STDIN, output_device=STDOUT)
    @interpreter = interpreter
    @executive = executive
    @input_device = input_device
    @output_device = output_device
  end
  
  def play
    input = input_device.gets.chomp
    command = interpreter.interpret(input)
    instruction = command[:command]
    args = command[:args]
    output = executive.instance_exec(*args, &instruction)
    output_device.puts output
  end
  
end