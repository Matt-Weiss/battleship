class Computer

  def initialize
    @messaging = Messaging.new
  end

  def smart_same_row?(coordinate_array)
    collect_letters = coordinate_array.collect do |coord|
      coord.chr
    end
    collect_letters.uniq.length == 1
  end

  def smart_sequential_rows?(coordinate_array, computer_board)
    collect_letters = coordinate_array.collect do |coord|
      coord.chr
    end
    possible_y = computer_board.y_range.each_cons(coordinate_array.length)
    possible_y.include?(collect_letters.sort)
  end

  def smart_same_column?(coordinate_array)
    collect_column = coordinate_array.collect do |coord|
      coord.slice(1,2)
    end
    collect_column.uniq.length == 1
  end

  def smart_sequential_columns?(coordinate_array, computer_board)
    collect_columns = coordinate_array.collect do |coord|
      coord.slice(1,2)
    end
    possible_x = computer_board.x_range.each_cons(coordinate_array.length)
    possible_x.include?(collect_columns.sort)
  end

  def valid_adjacencies?(coordinate_array, computer_board)
    (smart_same_column?(coordinate_array) &&
    smart_sequential_rows?(coordinate_array, computer_board)) ||
    (smart_sequential_columns?(coordinate_array, computer_board) &&
    smart_same_row?(coordinate_array))
  end

  def place_ship(ship, computer_board, smart_placement = [])
    until computer_board.valid_placement?(ship, smart_placement) do
      smart_placement = [computer_board.cells.keys.sample(1)[0]]
      until smart_placement.length == ship.length do
        smart_placement << computer_board.cells.keys.sample(1)[0]
        if !valid_adjacencies?(smart_placement, computer_board)
          smart_placement.pop
        end
      end
    end
    computer_board.place(ship, smart_placement)
  end

  def fire(player_board)
    target = player_board.cells.keys.sample(1)
      while player_board.cells[target[0]].fired_upon?
      target = player_board.cells.keys.sample(1)
      end
    player_board.cells[target[0]].fire_upon
    #following is feedback for shots fired by computer
    if player_board.cells[target[0]].render == "X"
      @messaging.computer_shot_sinks(target[0])
    elsif player_board.cells[target[0]].render == "H"
      @messaging.computer_shot_hits(target[0])
    else
      @messaging.computer_shot_missed(target[0])
    end
  end
end
