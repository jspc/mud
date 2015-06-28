require 'mud/action'

# A 'movement' action
class Movement < Action
  attr_reader :direction

  # Create a movement action
  #
  # ===== Attributes
  # * +direction+ - direction in which to move
  # * +running+ - whether or not the action is at a run
  def initialize direction, running=nil
    @direction = direction
    @running = running
    @type = 'movement'
  end

  # Return a boolean to determine whether user is running
  def running?
    !@running.nil?
  end

end
