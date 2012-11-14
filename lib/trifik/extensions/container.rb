module Container
  def self.included(base)
    base.has_many :items, as: :container
  end
  
  def self.extended(object)
    #this hackery allows individual objects to become containers
    class << object
      def self.reflection
        superclass.reflection
      end
      
      def self.name
        superclass.name
      end
      
      has_many :items, as: :container
    end
  end
  
end