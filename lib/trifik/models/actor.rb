class Actor < HashtiveRecord::Base
  include Container
  
  columns :name, :description
  belongs_to :room

  
end