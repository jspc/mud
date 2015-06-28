# Simple player class
class Player
  attr_accessor :weapons, :items, :strength, :speed, :luck, :vision, :cash, :health

  # Create a player. Takes a block
  #
  # ===== Attributes
  # * +:weapons+ - an array of weapon objects
  # * +:items+ - an array of item objects
  # * +:strength+ - strength of a character; higher = better
  # * +:speed+ - speed of a character; higher = better
  # * +:luck+ - luck of a character; higher = better
  # * +:vision+ - vision of a character; higher = better
  # * +:health+ - health of a character as a percentage
  # * +:cash+ - cash of a char; if you're so inclined: higher = better
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

  # Resets the players weapons, items and health
  def reset
    @weapons.clear
    @items.clear
    @health = 100
  end

  # Determines how much a character can carry
  def max_items
    @strength * 2 + 10
  end

  # Determines how quickly a character can run based on carry-load and speed
  def running_speed
    @speed - ((@items.size + @weapons.size)/2)
  end

  # Add an item to the items list
  def add_item item ; add item, @items; end

  # Add a weapon to the weapons list
  def add_weapon item ; add item, @weapons; end

  private
  def add item, ary
    if (@items.size + @weapons.size) >= max_items
      return false
    end
    ary << item
  end

end
