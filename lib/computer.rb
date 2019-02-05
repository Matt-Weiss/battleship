class Computer

  def initialize
    @messaging = Messaging.new
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
