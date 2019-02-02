require 'minitest/autorun'
require 'minitest/pride'

def test_do_we_have_a_player

end

def test_did_player_choose_to_play

end

def test_did_player_choose_correct_format_for_coordinates
#make sure it's not something like 1A
end

def test_did_player_choose_consecutive_coordinates_for_cruiser
#check for adjacency of ship
#check for overlapping here also?  Or a separate test?
end

def test_did_player_choose_consecutive_coordinates_for_submarine
#check for adjacency of ship
#check for overlapping here also? Or a separate test?
end

def test_did_computer_placed_one_cruiser
#check for adjacency and overlapping
end

def test_did_computer_placed_one_submarine
#check for adjacency and overlapping
end

def test_are_we_ready_to_play
#do we need this test?
end

def test_did_player_provide_a_valid_cell_to_fire_upon
#check for format i.e., it is not something like 1A or out of range
#check if the cell was already fired upon. Miss a turn?
end

def test_result_of_player_firing
#was it a hit or miss.
end

def test_result_of_computer_firing
#was it a hit or miss.
end

def test_did_computer_fire_on_a_valid_cell
#make sure computer never fires on a cell that was
#already fired upon.
end

def test_player_ships_are_sunk
#we are not testing if the ships can be sunk here
#because this is accomplished in ship.rb
end

def test_computer_ships_are_sunk
#we are not testing if the ships can be sunk here
#because this is accomplished in ship.rb
end

def test_has_game_ended
#test who sunk all their ships.
end

def test_player_wants_to_play_again

end

def test_player_wants_to_quit_in_middle_of_game

end

def test_player_wants_to_quit_at_the_end_of_game

end
