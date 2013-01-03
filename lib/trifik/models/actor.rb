class Actor < HashtiveRecord::Base
  include Trifik::Thing
  include Container
  
  belongs_to :room
  #untested
  has_many :conversations

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
  
  #untested
  def no_reply
    record.no_reply || "I don't understand"
  end
  
end