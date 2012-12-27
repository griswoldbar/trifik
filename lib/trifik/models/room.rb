class Room < HashtiveRecord::Base
  include Trifik::Model
  include Container
      
  has_many :actors
  has_many :players
  has_many :exits, class_name: :connection, foreign_key: :exit_id
  has_many :entrances, class_name: :connection, foreign_key: :entrance_id
  belongs_to :zone
  
  def directions
    exits.map(&:direction)
  end
  
  def has_direction?(direction)
    directions.include? direction
  end
  
  def method_missing(method, *args, &block)
    if Room.directions.include?(method)
      adjacent(method)
    else
      super(method, *args, &block)
    end
  end
  
  def adjacents
    exits.map(&:entrance)
  end

  def adjacent(direction)
    return nil unless directions.include?(direction)
    exit = exits.find {|exit| exit.direction == direction }
    exit ? exit.entrance : nil
  end
  
  def title
    "#{article} #{name}".strip.capitalize
  end
  
  def respond_to?(method)
    Room.directions.include?(method) || super
  end
  

end