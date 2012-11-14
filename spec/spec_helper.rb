require 'rspec'
require 'factory_girl'

require './lib/requirements'
Dir.glob("./spec/support/*.rb") {|file| require file}

FactoryGirl.find_definitions

database = HashtiveRecord::Storage::Database.new
[:actors,:items,:rooms,:connections,:players,:trifs].each do |table_name|
  table = HashtiveRecord::Storage::Table.new(table_name)
  database << table
end


HashtiveRecord::Base.database = database

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

RSpec.configure do |config|
  config.color_enabled = true
end
