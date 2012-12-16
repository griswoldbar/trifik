module Wanderer
  include Tickable
  
  def tock
    super
    walk
  end
  
  private
  def walk
    self.room = room.adjacents.sample
  end
  
end