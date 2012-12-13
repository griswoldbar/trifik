module Patroller
  include Tickable
  
  def tock
    super
    walk
  end
  
  def path
    patroller.path || room.id
  end
  
  # def path=(val)
  # 
  # end
  # 
  private
  
  def patroller
    modifiers.patroller
  end
  
  def walk
    current_position = patroller.position || path.index(room.id)
    next_index = ((current_position + 1) % path_length)
    patroller.position = next_index
    next_room_id = path[next_index]
    self.room = Room.find(next_room_id)
  end
  
  def path_length
    path.size
  end
end