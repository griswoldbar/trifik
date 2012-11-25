class Actor < HashtiveRecord::Base
  include Container
  
  columns :name, :description
  belongs_to :room

  class << self
    def inherited(base)
      super
      base.columns :name, :description
      base.belongs_to :room
    end
  end
  
end