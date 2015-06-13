class Room
  attr_writer :top, :bottom, :left, :right, :x, :y
  attr_accessor :coords

  def initialize
    @x = 0
    @y = 0
    yield self if block_given?
    @coords = { x: @x.to_i, y: @y.to_i }
  end

  def is_top? ; return is_true? @top; end
  def is_bottom? ; return is_true? @bottom; end
  def is_left? ; return is_true? @left; end
  def is_right? ; return is_true? @right; end

  private
  def is_true? var
    return var && var == true
  end

end
