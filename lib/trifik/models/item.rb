class Item < HashtiveRecord::Base
  columns :name, :description
  belongs_to :container, polymorphic: true


end