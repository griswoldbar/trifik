class Room < HashtiveRecord::Base
  include Container
  columns :name, :description
  
  has_many :actors
  has_many :players
  has_many :connections, as: :adjacent
  


end