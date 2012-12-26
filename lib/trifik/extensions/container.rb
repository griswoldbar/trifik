module Container  
  extend ActiveSupport::Concern

  included { has_many :items, foreign_key: :container_id }

  def self.extended(object)
    #this hackery allows individual objects to become containers
    class << object

      self.reflection = HashtiveRecord::Reflection.new(self.superclass)
      def self.name
        superclass.name
      end

      has_many :items, foreign_key: :container_id
    end
  end
  
  def has_item?(item)
    items.include? item
  end
  

end

