class Room < HashtiveRecord::Base
  include Trifik::Model
  include Container
      
  has_many :actors
  has_many :players
  has_many :exits, class_name: :connection, foreign_key: :exit_id
  has_many :entrances, class_name: :connection, foreign_key: :entrance_id
  
  def self.directions
    Trifik::DIRECTIONS
  end
  
  def method_missing(method, *args, &block)
    if Room.directions.include?(method)
      adjacent(method)
    else
      super(method, *args, &block)
    end
  end


  private
  def adjacent(direction)
    exit = exits.find {|exit| exit.direction == direction }
    exit ? exit.entrance : nil
  end
  

end