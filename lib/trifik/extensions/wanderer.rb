module Wanderer
  include Mover
  include Tickable
  
  def walk
    self.room = room.adjacents.sample
  end
  
  def tock
    super
    walk
  end
  
end