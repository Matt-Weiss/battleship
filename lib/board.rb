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
    cells_array = cells_array_raw.collect do
      |coordinate| coordinate.join
    end
    valid_cells_array = cells_array.collect do |coordinate|
      {coordinate => Cell.new(coordinate)}
    end
    valid_cells = valid_cells_array.inject(:merge)
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end

  def valid_length?(ship, coordinate_array)
    coordinate_array.length == ship.length
  end

  def same_row?(ship, coordinate_array)
    collect_letters = coordinate_array.collect do |coord|
      coord.chr
    end
    collect_letters.uniq.length == 1
  end

  def sequential_rows?(ship, coordinate_array)
    collect_letters = coordinate_array.collect do |coord|
      coord.chr
    end
    possible_x = []
    @x_range.each_cons(ship.length) do |cons|
      possible_x << cons
    end
    possible_x.include?(collect_letters.sort)
  end

  def same_column?(ship, coordinate_array)
    collect_column = coordinate_array.collect do |coord|
      coord.reverse.chr.to_i
    end
    verify_same_row = collect_column.uniq.length == 1
  end
  #
  def sequential_columns?(ship, coordinate_array)
    collect_columns = coordinate_array.collect do |coord|
      coord.reverse.chr
    end
    possible_y = []
    @y_range.each_cons(ship.length) do |cons|
      possible_y << cons
    end
    possible_y.include?(collect_columns.sort)
  end
  #
  def valid_adjacencies?(ship, coordinate_array)
    valid_adjacency = (same_column? && sequential_rows?) || (sequential_columns? && same_row?)
  end
  #
  # def valid_placement?(ship, coordinate_array)
  #
  # end

end
