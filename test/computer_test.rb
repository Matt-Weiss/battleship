require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_exists
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_can_fire_on_cell
    skip
    computer = Computer.new
    computer_board = Board.new
    player_board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    computer.fire(player_board)
    # binding.pry

  end

  def test_it_wont_fire_on_same_cell_twice
    skip
  end

  def test_it_can_place_valid_ships
    # skip
    computer = Computer.new
    computer_board = Board.new
    player_board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

binding.pry
    computer.place_ship(cruiser, computer_board)
  end

end
