class Executive
  attr_reader :player
  
  def initialize(player)
    @player = player
  end
  

  
  def look
    ["#{room.article.capitalize} #{room.name}.",
     "#{room.description.capitalize}.",
     room.actors.map{|a| "#{a.name.capitalize} is here" }
    ].join("\n")
  end


  private
  
  def room
    player.room
  end
end