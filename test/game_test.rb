require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer'
require './lib/board'
require './lib/cell'
require './lib/messaging'
require './lib/game'
require './lib/ship'
require 'pry'

class GameTest < MiniTest::Test

  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_player_initiates_game_by_entering_p
    game = Game.new
    game.run

    #need to test that when player enters p, game starts with welcome message.
    #need to test that game quits when q is entered.
  end

  def test_did_player_choose_correct_format_for_coordinates
  #make sure it's not something like 1A
  end

  def test_computer_ships_placed_correctly

  end

  def test_player_ships_placed_correctly

  end

  def test_computer_fired_successfully

  end

  def test_player_fired_successfully

  end

  def test_computer_can_sink_player_ship

  end

  def test_player_can_sink_computer_ship

  end

  def test_game_has_ended

  end
end
