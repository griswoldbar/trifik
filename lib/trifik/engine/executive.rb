class Executive
  attr_reader :player
  
  def initialize(player)
    @player = player
  end
  
  def look
    information = []
    information << Presenter.header(room.title)
    information << room.description + "."
    information << room.actors.map{|a| "#{a.article_name.titleize} is here." }
    information << room.exits.map{|r| r.description.capitalize}
    if room.items.any?
      information << "There is:"
      information << room.items.map{|room| "  #{room.article_name}"}
    end
    information.flatten.join("\n")
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
    
  def no_such_move(command)
    "I don't understand what you mean by \'#{command}'"
  end
  
  Trifik::DIRECTIONS.each do |direction|
    define_method direction do
      if player.room == player.move(direction)
        "You can't go that way"
      else
        look
      end      
    end
  end

  private
  
  def room
    player.room
  end
end