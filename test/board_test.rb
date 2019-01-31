require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_cells_form_properly
    board = Board.new

    assert_equal 16, board.cells.count
    assert board.cells.has_key?("A1")
    assert_instance_of Cell, board.cells["A1"]
  end

  def test_can_check_valid_coordinates
    board = Board.new

    assert board.valid_coordinate?("A1")
    refute board.valid_coordinate?("A5")
  end

  def test_for_valid_ship_placement_based_on_length
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)


    refute board.valid_length?(cruiser, ["A1", "A2"])
    assert board.valid_length?(submarine, ["A1", "A2"])
    refute board.valid_length?(submarine, ["A1", "A2", "A3"])
    assert board.valid_length?(cruiser, ["A1", "A2", "A3"])
  end

  def test_for_valid_ships_in_one_row
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    refute board.same_row?(cruiser, ["A1", "B1", "C1"])
    assert board.same_row?(submarine, ["A1", "A2"])
    refute board.same_row?(submarine, ["A1", "B1"])
    assert board.same_row?(cruiser, ["A1", "A2", "A3"])
  end

  def test_for_valid_ships_in_sequential_rows
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert board.sequential_rows?(cruiser, ["A1", "B1", "C1"])
    assert board.sequential_rows?(submarine, ["A1", "B1"])
    refute board.sequential_rows?(submarine, ["A1", "A2"])
    refute board.sequential_rows?(cruiser, ["A1", "A2", "A3"])
  end
end
