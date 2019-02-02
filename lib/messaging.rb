class Messaging

  def welcome_message
    p "--------- Welcome to Battleship ---------"
    p "-------------Enter p to play-------------"
    p ""
    p "I bet you have a sinking feeling right now..."
    p "-------------Enter q to quit-------------"
  end

  def player_ship_placement_instruction
    p "We each get two ships, one cruiser and one submarine."
    p "The cruiser occupies three cells."
    p "The submarine occupies two cells."
    p "------------------------------------------------------"
    p "Enter your coordinates in the following format: "
    p "(example: C2 C3 C4 for cruiser or A1 B1 for submarine)"
    p "-" * 25
  end

  def player_valid_coordinates_cruiser
    p "Enter coordinates for your cruiser: "
  end

  def player_valid_coordinates_submarine
    p "Enter coordinates for your submarine: "
  end

  def player_invalid_coordinates
    p "I have a sinking feeling these are invalid coordinates, try again."
  end

  def ready_to_play
    p "-" * 25
    p "******Prepare for battle!******"
    p "-" * 25
    p "Before you fire at me, you should know:"
    p "'M' for missed shots."
    p "'H' for hitting a cell with a ship."
    p "'X' for a sunken ship."
    p "'.' for empty cell."
  end

  def player_fires_upon
    p "See if you can sink me. Enter the coordinate for your shot:"
  end

  def player_invalid_coordinates_to_fire_upon
    p "If you want to sink me, pick a better coordinate."
  end

  def player_shot_missed
    p "Your shot on (cell) was a miss."
  end

  def player_shot_hits
    p "Your shot on (cell) hit me!"
  end

  def player_sinks_ship
    p "Blimey! Your shot on (cell) sunk me ship!"
  end

  def computer_shot_missed
    p "My shot on (cell) was a miss."
  end

  def computer_shot_hits
    p "My shot on (cell) was hit."
  end

  def computer_shot_sinks
    p "Aye, my shot on (cell) sunk your ship!"
  end

  def player_wins
    p "Shiver me timbers, you sunk all my ships!  You won!"
  end

  def computer_wins
    p "I won!"
  end

  def play_again?
    p "Would you like to play another game?"
    p "Enter p to play: "
  end

  def player_quits
    p "Enter q to quit: "
  end
end
