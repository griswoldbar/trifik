module Mover

  def move(direction)
    self.room = self.room.send(direction) || self.room
  end
  
end