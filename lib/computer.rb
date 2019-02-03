class Computer

  def initialize
  end

  def place_ship(ship, computer_board)
    possible_placements = []
    while !computer_board.valid_placement?(ship, possible_placements) do
      possible_placements = computer_board.cells.keys.sample(ship.length)
    end
    computer_board.place(ship, possible_placements)
  end

  def fire(player_board)
    target = player_board.cells.keys.sample(1)
      while player_board.cells[target[0]].fired_upon?
      target = player_board.cells.keys.sample(1)
      end
    player_board.cells[target[0]].fire_upon
  end

end
