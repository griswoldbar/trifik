require 'bundler'
Bundler.require

require 'hashtive_record'

require_relative 'trifik/extensions/model'
require_relative 'trifik/extensions/thing'
require_relative 'trifik/config/application'
require_relative 'trifik/config/modifier'
require_relative 'trifik/engine/ticker'
require_relative 'trifik/engine/executive'
require_relative 'trifik/engine/interpreter'
require_relative 'trifik/config/interpreter'
require_relative 'trifik/engine/game'
require_relative 'trifik/presentation/presenter'

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
require_relative 'trifik/models/conversation'
