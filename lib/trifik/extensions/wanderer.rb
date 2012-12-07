module Wanderer
  include Mover
  
  #untested
  def walk
    self.room = room.adjacents.sample
  end
  
end