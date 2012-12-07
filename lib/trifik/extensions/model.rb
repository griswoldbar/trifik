module Trifik
  
  module Configuration
    def configure(&block)  
      instance_eval(&block)  
    end
    
    def default_columns=(vals)
      @default_columns = vals
    end
    
    def default_columns
      @default_columns ||= [:screen_name, :name, :description]
    end
    
  end
  
  module Model
    extend Configuration
    extend ActiveSupport::Concern

    def screen_name
      record.screen_name || record.name
    end

    def self.included(base)
      base.columns *default_columns
    end
    
    module ClassMethods
      def directions
        Trifik::DIRECTIONS
      end
    end
    
  end
  
end