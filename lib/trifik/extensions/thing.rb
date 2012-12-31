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
  
  module Thing
    include Trifik::Model
    extend Configuration
    extend ActiveSupport::Concern
    
    def self.included(base)
      base.columns *default_columns
    end
    
    def screen_name
      record.screen_name || record.name
    end

    def article
      record.article || ""
    end
    
    def article_name
      self.article.blank? ? name : "#{article} #{name}"
    end
    
  end
  
end