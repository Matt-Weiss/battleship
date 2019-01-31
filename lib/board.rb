class Board

  attr_reader :x_dimension, :y_dimension, :cells

  def initialize(x_dimension = 4, y_dimension = 4)
    @x_dimension = x_dimension
    @y_dimension = y_dimension
    @cells = build_cells
  end

  def build_cells
    @x_range = (65.chr)..((@x_dimension+64).chr)
    x_array = @x_range.to_a

    @y_range = (1.to_s)..(@y_dimension.to_s)
    y_array = @y_range.to_a

    cells_array_raw = x_array.product(y_array)
    cells_array = cells_array_raw.collect {|coordinate| coordinate.join}

    valid_cells_array = cells_array.collect {|coordinate| {coordinate => Cell.new(coordinate)}}
    valid_cells = valid_cells_array.inject(:merge)
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end


  def valid_length?(ship, coordinate_array)
    coordinate_array.length == ship.length
  end

  def same_row?(ship, coordinate_array)
    collect_letters = coordinate_array.collect{|coord| coord.chr}
    collect_letters.uniq.length == 1
  end

  def sequential_rows?(ship, coordinate_array)
    collect_letters = coordinate_array.collect{|coord| coord.chr}
    possible_x = []
    @x_range.each_cons(ship.length){|cons| possible_x << cons }
    possible_x.include?(collect_letters.sort)
  end

  # def same_column?(ship, coordinate_array)
  #   collect_row = coordinate_array.collect{|coord| coord.reverse.chr.to_i}
  #   verify_same_row = collect_row.uniq.length == 1
  # end
  #
  # def sequential_columns?(ship, coordinate_array)
  #   collect_rows = coordinate_array.collect{|coord| coord.reverse.chr.to_i}
  #   sort_rows = collect_rows.sort
  #   verify_rows = sort_rows.all? {|x,y| y == x + 1}
  # end
  #
  # def valid_adjacencies?(ship, coordinate_array)
  #   valid_adjacency = (same_column? && sequential_rows?) || (sequential_columns? && same_row?)
  # end
  #
  # def valid_placement?(ship, coordinate_array)
  #
  # end

end
