class Player < Actor
  include Mover
  
  def chronicler
    Chronicler.all.first
  end
  
end