class Player
  attr_accessor :weapons, :items, :strength, :speed, :luck, :vision, :cash, :health

  def initialize
    @weapons = []
    @items   = []

    @strength = 1
    @speed    = 1
    @luck     = 1
    @vision   = 1

    @health = 100
    @cash   = 0

    yield self if block_given?
  end

  def reset
    @weapons.clear
    @items.clear
    @health = 100
  end

  def max_items
    @strength * 2 + 10
  end

  def running_speed
    @speed - ((@items.size + @weapons.size)/2)
  end

  def add_item item ; add item, @items; end
  def add_weapon item ; add item, @weapons; end

  private
  def add item, ary
    if (@items.size + @weapons.size) >= max_items
      return false
    end
    ary << item
  end

end
