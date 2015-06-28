require 'mud/room'

# Largely our map and relevent navigation code for
# the dungeon it's self
#
# Contains arrays of arrays of Rooms
class Graph
  attr_writer :width, :height
  attr_reader :graph

  # Initialise the graph with a block
  #
  # ===== Attributes
  # * +:width+ - Width of the map
  # * +:height+ - Height of the map
  def initialize
    yield self if block_given?
    @width  ||= 10
    @height ||= 20

    @graph = []
    @height.times do |y|
      row = []
      t = @graph.empty? ? true : false
      b = @graph.size == (@height - 1) ? true : false

      @width.times do |x|
        l = row.empty? ? true : false
        r = row.size == (@width - 1) ? true : false

        row << Room.new do |room|
          room.top = t
          room.bottom = b
          room.left = l
          room.right = r
          room.y = y
          room.x = x
        end

      end
      @graph << row
    end
  end

  # Returns coordinates of next room should the direction be available
  #
  # For instance: on the left most side of the map one cannot go any further left
  #
  # ===== Attributes
  # * +room+ - current room object
  # * +direction+ - direction to move in, if possible
  def traverse room, direction
    case direction.to_sym
    when :right
      return @graph[room.coords[:y]][room.coords[:x] + 1] unless room.is_right?
    when :left
      return @graph[room.coords[:y]][room.coords[:x] - 1] unless room.is_left?
    when :up
      return @graph[room.coords[:y] - 1][room.coords[:x]] unless room.is_top?
    when :down
      return @graph[room.coords[:y] + 1][room.coords[:x]] unless room.is_bottom?
    end

    return false
  end

end
