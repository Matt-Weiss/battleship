class Board

  attr_reader :x_dimension, :y_dimension, :cells

  def initialize(x_dimension = 4, y_dimension = 4)
    @x_dimension = x_dimension
    @y_dimension = y_dimension
    @cells = build_cells
  end

  def build_cells
    @y_range = (65.chr)..((@y_dimension+64).chr)
    y_array = @y_range.to_a

    @x_range = (1.to_s)..(@x_dimension.to_s)
    x_array = @x_range.to_a

    cells_array_raw = y_array.product(x_array)
    cells_array = cells_array_raw.collect do
      |coordinate| coordinate.join
    end
    cells_hash = {}
    cells_array.each do |coord|
      cells_hash[coord] = Cell.new(coord)
    end
    cells_hash
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
    possible_y = @y_range.each_cons(ship.length)
    possible_y.include?(collect_letters.sort)
  end

  def same_column?(ship, coordinate_array)
    collect_column = coordinate_array.collect do |coord|
      coord.slice(1,2)
    end
    collect_column.uniq.length == 1
  end

  def sequential_columns?(ship, coordinate_array)
    collect_columns = coordinate_array.collect do |coord|
      coord.slice(1,2)
    end
    possible_x = @x_range.each_cons(ship.length)
    possible_x.include?(collect_columns.sort)
  end

  def valid_adjacencies?(ship, coordinate_array)
    #This also covers the diagonal check
    (same_column?(ship, coordinate_array) &&
    sequential_rows?(ship, coordinate_array)) ||
    (sequential_columns?(ship, coordinate_array) &&
    same_row?(ship, coordinate_array))
  end

  def overlap?(ship, coordinate_array)
    overlap_check = coordinate_array.select do |coord|
      @cells[coord].empty?
    end
    overlap_check.length != coordinate_array.length
  end

  def place(ship, coordinate_array)
    if valid_placement?(ship, coordinate_array)
      coordinate_array.each do |coord|
        @cells[coord].place_ship(ship)
      end
    end
  end

  def valid_placement?(ship, coordinate_array)
    valid_adjacencies?(ship, coordinate_array) &&
    !overlap?(ship, coordinate_array) &&
    valid_length?(ship, coordinate_array)
  end

  def render(player = false)
    cells_array = []
    cell_keys = cells.keys
    cells_array <<  "  "
    @x_range.each {|x| cells_array << x + "  " }
    cells_array <<  "\n"
    @y_dimension.times do
      cells_array << cell_keys[0].chr
      cells_array << " "
        @x_dimension.times do
        cells_array << cells[cell_keys[0]].render(player)
        cells_array << "  "
        cell_keys.shift
        end
    cells_array << "\n"
    end
    p cells_array.join
    # binding.pry
  end

  # def render(player = false)
  #   cell_keys = cells.keys
  #   print "  "
  #   @x_range.each {|x| print x + "  " }
  #   print "\n"
  #   @y_dimension.times do
  #     print cell_keys[0].chr
  #     print " "
  #       @x_dimension.times do
  #       print cells[cell_keys[0]].render(player)
  #       print "  "
  #       cell_keys.shift
  #       end
  #     print "\n"
  #   end
  # end

end
