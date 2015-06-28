$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'simplecov'
SimpleCov.start

require 'mud/room'
require 'mud/graph'
require 'mud/player'
require 'mud/server'
require 'mud/parser'

require 'factory_girl'
require 'rspec'

%w{support factories}.each do |d|
  Dir["./spec/#{d}/**/*.rb"].sort.each { |f| require f}
end
