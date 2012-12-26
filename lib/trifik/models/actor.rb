class Actor < HashtiveRecord::Base
  include Trifik::Model
  include Container
  
  belongs_to :room

  class << self
    def inherited(base)
      super
      base.columns :name, :description
      base.belongs_to :room
    end
  end
  
  def zone
    room.zone
  end
  
end