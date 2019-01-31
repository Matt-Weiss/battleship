class Ship

  attr_reader :name, :length, :health
  def initialize(type_of_ship, length_of_ship)
    @name = type_of_ship
    @length = length_of_ship
    @health = length_of_ship
  end

  def hit
    @health -= 1
  end

  def sunk?
    @health <= 0
  end

end
