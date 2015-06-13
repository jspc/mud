require 'mud/room'

class Graph
  attr_writer :width, :height
  attr_reader :graph

  def initialize
    @width  = 10
    @height = 20
    yield self if block_given?

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
