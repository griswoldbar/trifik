module Wanderer
  include Mover
  
  def walk
    self.room = room.adjacents.sample
  end
  
end