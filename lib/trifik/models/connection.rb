class Connection < HashtiveRecord::Base
  include Trifik::Model

  columns :direction
  
  belongs_to :exit, class_name: :room
  belongs_to :entrance, class_name: :room

  
end