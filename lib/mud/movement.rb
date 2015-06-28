require 'mud/action'

class Movement < Action
  attr_reader :direction

  def initialize direction, running=nil
    @direction = direction
    @running = running
    @type = 'movement'
  end

  def running?
    !@running.nil?
  end

end
