class Executive
  attr_reader :player
  
  def initialize(player)
    @player = player
  end
  
  def look
    [room.title,
     "#{room.description.capitalize}.",
     room.actors.map{|a| "#{a.article_name.titleize} is here." },
     "There is:",
     room.items.map(&:article_name)
    ].flatten.join("\n")
  end

  def execute(verb, object=nil, indirect_object=nil)
    if !!object
      if !!indirect_object
        object.send(verb, player, indirect_object)
      else
        object.send(verb, player)
      end
    else
      send(verb)
    end
  end
    
  Trifik::DIRECTIONS.each do |direction|
    define_method direction do
      player.move(direction)
    end
  end

  private
  
  def room
    player.room
  end
end