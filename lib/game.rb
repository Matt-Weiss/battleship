class Game
  
  def initialize
    @messaging = Messaging.new
    @player_board = Board.new
    @computer_board = Board.new
    @computer = Computer.new
  end

  def run
    play_quit = nil
    while play_quit != "p" && play_quit != "q" do
      @messaging.welcome_message
      play_quit = gets.chomp
    end
    if play_quit == "p"
      game_play
    else
      @messaging.game_ends
    end
  end

  def game_play
    computer_ship_placement
    player_ship_placement
    @messaging.ready_to_play

    while player_board_health > 0 && computer_board_health > 0
      boards_rendered
      player_turn
      computer_turn
    end

    if computer_board_health == 0
      @messaging.player_wins
    else
      @messaging.computer_wins
    end

    @messaging.play_again
    run
  end

  def computer_ship_placement
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @computer.place_ship(cruiser, @computer_board)
    @computer.place_ship(submarine, @computer_board)
    @messaging.computer_ships_placed
  end

  def player_ship_placement
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @messaging.player_ship_placement_instruction
    @player_board.render(true)
    player_places_cruiser
    player_places_submarine
  end

  def player_places_cruiser
    cruiser = Ship.new("Cruiser", 3)
    @messaging.player_valid_coordinates_cruiser
    cruiser_placement = gets.upcase.chomp
    placement_array = cruiser_placement.split(" ")
    until @player_board.valid_placement?(cruiser, placement_array) do
        @messaging.player_invalid_coordinates
        @messaging.player_valid_coordinates_cruiser
        cruiser_placement = gets.chomp
        placement_array = cruiser_placement.split(" ")
      end
      @player_board.place(cruiser, placement_array)
      @player_board.render(true)
  end

  def player_places_submarine
    submarine = Ship.new("Submarine", 2)
    @messaging.player_valid_coordinates_submarine
    submarine_placement = gets.upcase.chomp
    placement_array = submarine_placement.split(" ")
    until @player_board.valid_placement?(submarine, placement_array) do
        @messaging.player_invalid_coordinates
        @messaging.player_valid_coordinates_cruiser
        submarine_placement = gets.chomp
        placement_array = submarine_placement.split(" ")
      end
      @player_board.place(submarine, placement_array)
      @player_board.render(true)
  end

  def boards_rendered
    @messaging.computer_board_header
    @computer_board.render
    @messaging.player_board_header
    @player_board.render(true)
  end

  def player_turn
    @messaging.player_fires_upon
    player_shot = gets.chomp
    until @computer_board.valid_coordinate?(player_shot) do
      @messaging.player_invalid_coordinates_to_fire_upon
      @messaging.player_fires_upon
      player_shot = gets.chomp
    end
    @computer_board.cells[player_shot].fire_upon
  #following is feedback for shots fired by player
    if @computer_board.cells[player_shot].render == "X"
      @messaging.player_sinks_ship(player_shot)
    elsif @computer_board.cells[player_shot].render == "H"
      @messaging.player_shot_hits(player_shot)
    else
      @messaging.player_shot_missed(player_shot)
    end
  end

  def computer_turn
    @computer.fire(@player_board)
  end

  def player_board_health
    ships_on_board = @player_board.cells.collect do |key, value|
      @player_board.cells[key].ship
    end.compact

    total_ship_health = ships_on_board.inject(0) do |sum, ship|
      sum += ship.health
    end
  end

  def computer_board_health
    ships_on_board = @computer_board.cells.collect do |key, value|
      @computer_board.cells[key].ship
    end.compact

    total_ship_health = ships_on_board.inject(0) do |sum, ship|
      sum += ship.health
    end
  end
end
