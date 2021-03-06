class Messaging

  def welcome_message
    puts "--------- Welcome to Battleship ---------"
    puts "-------------Enter p to play-------------"
    puts "-------------Enter q to quit-------------"
    puts ""
  end

  def choose_board_size
    puts "You can choose from the following board size: "
    puts "For 4x4 board enter 1."
    puts "For 10x10 board enter 2."
    print "Please enter your choice, 1 or 2: "
  end

  def invalid_board_size
    puts "That was an invalid choice."
    puts "For 4x4 board enter 1."
    puts "For 10x10 board enter 2."
    print "Please enter your choice, 1 or 2: "
  end

  def computer_ships_placed
    puts ""
    puts "I have placed my ships. Now it's your turn."
    puts "I bet you have a sinking feeling right now..."
    puts ""
  end

  def ships_available(ship_array)
    puts "We each get #{ship_array.length} ships."
    ship_array.each do |ship|
      puts "The #{ship.name} occupies #{ship.length} cells."
    end
  end

  def player_ship_placement_instruction
    puts "------------------------------------------------------"
    puts "Enter your coordinates in the following format: "
    puts "(example: C2 C3 C4 for cruiser or A1 B1 for submarine)"
    puts "-" * 25
  end

  def player_valid_coordinates_ship(ship)
    puts "The #{ship.name} occupies #{ship.length} cells."
    puts "Enter coordinates for your #{ship.name}: "
  end

  def player_invalid_coordinates
    puts "I have a sinking feeling these are invalid coordinates, try again."
  end

  def ready_to_play
    puts "******Prepare for battle!******"
    puts "Before you fire at me, you should know:"
    puts "'M' for missed shots."
    puts "'H' for hitting a cell with a ship."
    puts "'X' for a sunken ship."
    puts "'.' for empty cell."
  end

  def computer_board_header
    puts ""
    puts ("=" * 15) + "COMPUTER BOARD" + ("=" * 15)
  end

  def player_board_header
    ""
    ""
    puts ("=" * 15) + "YOUR BOARD" + ("=" * 15)
  end

  def player_fires_upon
    print "See if you can sink me. Enter the coordinate for your shot: "
    puts ""
  end

  def player_invalid_coordinates_to_fire_upon
    puts "If you want to sink me, pick a better coordinate."
  end

  def player_shot_missed(cell)
    puts ""
    p "Your shot on #{cell} was a miss."
  end

  def player_shot_hits(cell)
    puts ""
    p "Your shot on #{cell} hit me!"
  end

  def player_sinks_ship(cell)
    puts ""
    p "Blimey! Your shot on #{cell} sunk me ship!"
  end

  def computer_shot_missed(cell)
    puts ""
    p "My shot on #{cell} was a miss."
  end

  def computer_shot_hits(cell)
    puts ""
    p "My shot on #{cell} was hit."
  end

  def computer_shot_sinks(cell)
    puts ""
    p "Aye, my shot on #{cell} sunk your ship!"
  end

  def player_wins
    puts ""
    puts "Shiver me timbers, you sunk all my ships!  You won!"
  end

  def computer_wins
    puts ""
    puts "I won!"
  end

  def play_again
    puts ""
    puts "Would you like to play another game?"
    puts ""
  end

  def player_quits
    puts ""
    puts "Enter q to quit: "
  end

  def game_ends
    puts ""
    puts "Goodbye! Thank you for playing."
  end
end
