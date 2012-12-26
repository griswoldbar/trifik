module Take
  
  def take(actor)
    if actor.room.has_item?(self)
      self.container = actor
      take_message
    else
      not_present_message
    end
  end
  
  private
  
  def take_message
    "#{name}: taken"
  end
  
end