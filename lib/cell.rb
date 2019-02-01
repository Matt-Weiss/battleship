class Cell

attr_reader :coordinate, :ship, :fired_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @render = "."
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
    if @ship != nil
      @ship.hit
    end
  end

  def render(player = false)
    if !fired_upon? && empty? == false && player == true
      print "S"
    elsif fired_upon? && empty? == false
      print "H"
    elsif fired_upon?
      print "M"
    else
      print "."
    end
  end

end
