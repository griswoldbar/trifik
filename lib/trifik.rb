require_relative 'requirements'


loc = File.expand_path File.dirname(__FILE__)
yaml_path = "#{loc}/trifik/yamls"
loader = HashtiveRecord::Loader.new(yaml_path)
loader.load