module Patroller
  #untested
  
  def patroller
    record.modifiers.patroller
  end
  
  def path
    patroller.path || room.id
  end
  
  def walk
    next_index = path.index(room.id).next % path_length
    next_room_id = path[next_index]
    self.room = Room.find(next_room_id)
  end
  
  private
  def path_length
    path.size
  end
end