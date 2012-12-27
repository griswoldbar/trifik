class Interpreter
  class InstructionNotFound < Exception; end
  @@instructions = []

  BAD_COMMAND = proc {|text| self.no_such_move(text) }

  def self.instructions
    @@instructions
  end
  
  def instructions
    @@instructions
  end
  
  def self.define &block
    instance_eval(&block)
  end
  
  def self.given(regex, &command)
    @@instructions << { regex: regex, command: command }
  end

  def interpret(text)
    instruction = matching_instruction(text)
    if !!instruction
      match_data = instruction[:regex].match(text)
      { command: instruction[:command], args: match_data.captures.map(&:to_sym) }
    else
      { command: BAD_COMMAND, args: text }
    end
  end

  # def normalize(text)
  #   text.split
  # end
  # 
  private
  def matching_instruction(text)
    instructions.find {|i| i[:regex].match text }
  end
end
