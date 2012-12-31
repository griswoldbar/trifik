module Trifik
  
  module Model
    extend ActiveSupport::Concern
    
    def ticker
      zone.ticker
    end
    
    module ClassMethods
      def directions
        Trifik::DIRECTIONS
      end
    end
    
  end
  
end