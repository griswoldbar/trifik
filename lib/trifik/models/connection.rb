class Connection < HashtiveRecord::Base
  
  columns :direction, :description
  
  belongs_to :exit, class_name: :room
  belongs_to :entrance, class_name: :room

  
end