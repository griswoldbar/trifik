require 'bundler'
Bundler.require

require 'hashtive_record'

require_relative 'trifik/extensions/container'
require_relative 'trifik/extensions/droppable'
require_relative 'trifik/extensions/killable'
require_relative 'trifik/extensions/smashable'
require_relative 'trifik/extensions/takeable'
require_relative 'trifik/models/actor'
require_relative 'trifik/models/connection'
require_relative 'trifik/models/item'
require_relative 'trifik/models/player'
require_relative 'trifik/models/room'

loc = File.expand_path File.dirname(__FILE__)
yaml_path = "#{loc}/trifik/yamls"
loader = HashtiveRecord::Loader.new(yaml_path)
loader.load