module Drop
  
  def drop(actor)
    if actor.has_item?(self)
      self.container = actor.room
      drop_message
    else
      not_possessed_message
    end
  end
  
  private
  def drop_message
    "#{name}: dropped"
  end
  
end