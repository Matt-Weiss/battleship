class Ship

  attr_reader :name, :length
  def initialize(type_of_ship, length_of_ship)
    @name = type_of_ship
    @length = length_of_ship
  end

end
