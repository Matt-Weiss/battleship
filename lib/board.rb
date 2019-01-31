class Board
  attr_reader :x_dimension, :y_dimension

  def initialize(x_dimension = 4, y_dimension = 4)
    @x_dimension = x_dimension
    @y_dimension = y_dimension
  end

  def cells
    x_array = ((65.chr)..((@x_dimension+64).chr)).to_a
    y_array = ((1.to_s)..(@y_dimension.to_s)).to_a
    cells_array = (x_array.product(y_array)).collect {|coordinate| coordinate.join}
    valid_cells = (cells_array.collect {|coordinate| {coordinate => Cell.new(coordinate)}}).inject(:merge!)
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end

  def valid_adjacencies(ship)
    x_cons =(((65.chr)..((@x_dimension+64).chr)).each_cons(ship.length)).to_a
    y_cons =(((1.to_s)..(@y_dimension.to_s)).each_cons(ship.length)).to_a
binding.pry
  end

  def valid_placement?(ship, coordinate_array)
    coordinate_array.length == ship.length
  end


end
