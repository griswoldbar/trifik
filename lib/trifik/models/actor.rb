class Actor < HashtiveRecord::Base
  
  columns :name, :description
  belongs_to :room

  
end