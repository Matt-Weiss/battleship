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

  def valid_adjacencies?(ship, coordinate_array)
    test_same_column = (coordinate_array.collect{|coord| coord.chr}.uniq.length) == 1
    test_sequential_rows = (coordinate_array.collect{|coord| coord.reverse.chr.to_i}.sort.each_cons(ship.length)).all? {|x,y| y == x + 1}
    test_same_row = (coordinate_array.collect{|coord| coord.reverse.chr.to_i}.uniq.length) == 1
    test_sequential_columns = coordinate_array.collect{|coord| coord.chr.ord}.sort.each_cons(ship.length).all? {|x,y| y == x + 1}

    valid_adjacency = (test_same_column && test_sequential_rows) || (test_sequential_columns && test_same_row)
    binding.pry
  end

  def valid_placement?(ship, coordinate_array)
    (coordinate_array.length == ship.length) && (valid_adjacencies?(ship, coordinate_array))

  end


end
