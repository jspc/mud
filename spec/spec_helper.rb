$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'mud/room'
require 'mud/graph'

require 'factory_girl'
require 'rspec'

%w{support factories}.each do |d|
  Dir["./spec/#{d}/**/*.rb"].sort.each { |f| require f}
end
