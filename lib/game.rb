class Game

  def initialize
    @messaging = Messaging.new
    @computer = Computer.new
    @ships = []
  end

  def run
    play_quit = nil
    while play_quit != "p" && play_quit != "q" do
      @messaging.welcome_message
      play_quit = gets.chomp.downcase
      sleep(0.75)
    end

    if play_quit == "p"

      @messaging.choose_board_size
      board_selection = gets.chomp

      until board_selection == "1" || board_selection == "2"
        @messaging.invalid_board_size
        @messaging.choose_board_size
        board_selection = gets.chomp
      end

      if board_selection == "1"
        game_setup_small
      else board_selection == "2"
        game_setup_standard
      end

    else
      @messaging.game_ends
    end
  end

  def computer_ship_placement
    @ships.each do |ship|
      @computer.place_ship(ship, @computer_board)
    end
    @messaging.computer_ships_placed
    sleep(0.75)
  end

  def game_setup_small
    @player_board = Board.new
    @computer_board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @ships = [cruiser, submarine]
    computer_ship_placement
    player_places_ships
  end

  def game_setup_standard
    @player_board = Board.new(10,10)
    @computer_board = Board.new(10,10)
    destroyer = Ship.new("Destroyer", 2)
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 3)
    battleship = Ship.new("Battleship", 4)
    carrier = Ship.new("Aircraft Carrier", 5)
    @ships = [destroyer, cruiser, submarine, battleship, carrier]
    computer_ship_placement
    player_places_ships
  end

  def player_places_ships
    @messaging.ships_available(@ships)
    @messaging.player_ship_placement_instruction
    @player_board.render(true)
    @ships.each do |ship|
      @messaging.player_valid_coordinates_ship(ship)
      ship_placement = gets.upcase.chomp
      placement_array = ship_placement.split(" ")

      until @player_board.valid_placement?(submarine, placement_array) do
        @messaging.player_invalid_coordinates
        @messaging.player_valid_coordinates_ship(ship)
        ship_placement = gets.upcase.chomp
        placement_array = ship_placement.split(" ")
      end
      @player_board.place(ship, placement_array)
      sleep(0.75)
      @player_board.render(true)
    end
  end

  def game_play
    sleep(1.5)
    @messaging.ready_to_play
    sleep(0.75)

    while player_board_health > 0 && computer_board_health > 0
      sleep(1)
      boards_rendered
      player_turn
      computer_turn
    end

    if computer_board_health == 0
      boards_rendered
      @messaging.player_wins
    else
      boards_rendered
      @messaging.computer_wins
    end

    @messaging.play_again
    run
  end

  def boards_rendered
    @messaging.computer_board_header
    @computer_board.render
    @messaging.player_board_header
    @player_board.render(true)
  end

  def player_turn
    @messaging.player_fires_upon
    player_shot = gets.upcase.chomp
    sleep(0.75)
    until @computer_board.valid_coordinate?(player_shot) do
      @messaging.player_invalid_coordinates_to_fire_upon
      @messaging.player_fires_upon
      player_shot = gets.upcase.chomp
    end
    @computer_board.cells[player_shot].fire_upon
  #following is feedback for shots fired by player
    if @computer_board.cells[player_shot].render == "X"
      @messaging.player_sinks_ship(player_shot)
      sleep(0.5)
    elsif @computer_board.cells[player_shot].render == "H"
      @messaging.player_shot_hits(player_shot)
      sleep(0.5)
    else
      @messaging.player_shot_missed(player_shot)
      sleep(0.5)
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
