require 'bundler'
Bundler.require

require 'hashtive_record'

require_relative 'trifik/extensions/model'
require_relative 'trifik/config/application'
require_relative 'trifik/config/modifier'
require_relative 'trifik/ticker'
require_relative 'trifik/executive'
# require_relative 'trifik/world'

require_relative 'trifik/extensions/tickable'
require_relative 'trifik/extensions/container'
require_relative 'trifik/extensions/mover'
require_relative 'trifik/extensions/wanderer'
require_relative 'trifik/extensions/patroller'

require_relative 'trifik/modifiers/drop'
require_relative 'trifik/modifiers/kill'
require_relative 'trifik/modifiers/smash'
require_relative 'trifik/modifiers/take'

require_relative 'trifik/models/zone'
require_relative 'trifik/models/actor'
require_relative 'trifik/models/connection'
require_relative 'trifik/models/item'
require_relative 'trifik/models/player'
require_relative 'trifik/models/room'

