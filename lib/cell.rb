class Cell

attr_reader :coordinate, :ship, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @ship != nil && !ship.sunk?
      @ship.hit
    end
  end

  def render(player = false)
    if empty? == false && ship.sunk?
      "X"
    elsif !fired_upon? && empty? == false && player == true
      "S"
    elsif fired_upon? && empty? == false
      "H"
    elsif fired_upon?
      "M"
    else
      "."
    end
  end

end
