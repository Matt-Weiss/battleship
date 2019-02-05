require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/messaging'
require './lib/game'
require './lib/ship'

class MessagingTest < Minitest::Test

  def test_it_exists
      message = Messaging.new
      assert_instance_of Messaging, message
  end

  def test_player_shot_missed
    message = Messaging.new
    actual = message.player_shot_missed("C1")

    assert_equal "Your shot on C1 was a miss.", actual
  end

  def test_player_shot_hits
    message = Messaging.new
    actual = message.player_shot_hits("B1")

    assert_equal "Your shot on B1 hit me!", actual
  end

  def test_player_sinks_ship
    message = Messaging.new
    actual = message.player_sinks_ship("A4")
    assert_equal "Blimey! Your shot on A4 sunk me ship!", actual
  end

  def test_computer_shot_missed
    message = Messaging.new
    actual = message.computer_shot_missed("D4")
    assert_equal "My shot on D4 was a miss.", actual
  end

  def test_coonputer_shot_hits
    message = Messaging.new
    actual = message.computer_shot_hits("D2")
    assert_equal "My shot on D2 was hit.", actual
  end

  def test_computer_shot_sinks
    message = Messaging.new
    actual = message.computer_shot_sinks("C2")
    assert_equal "Aye, my shot on C2 sunk your ship!", actual
  end

  def test_ships_available
    message = Messaging.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    ships_array = [cruiser, submarine]
    actual = message.ships_available(ships_array)
    expected = "The Submarine occupies 2 cells."

    assert_equal expected, actual
  end
end
