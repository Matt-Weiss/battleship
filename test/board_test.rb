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

  def test_for_valid_ships_in_same_column
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert board.same_column?(cruiser, ["A1", "B1", "C1"])
    assert board.same_column?(submarine, ["A1", "B1"])
    refute board.same_column?(submarine, ["A1", "A2"])
    refute board.same_column?(cruiser, ["A1", "A2", "A3"])
  end

  def test_for_valid_ships_in_sequential_columns
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    refute board.sequential_columns?(cruiser, ["A1", "B1", "C1"])
    refute board.sequential_columns?(submarine, ["A1", "B1"])
    assert board.sequential_columns?(submarine, ["A1", "A2"])
    assert board.sequential_columns?(cruiser, ["A1", "A2", "A3"])
  end

  def test_combined_adjacency
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert board.valid_adjacencies?(cruiser, ["A1", "B1", "C1"])
    assert board.valid_adjacencies?(submarine, ["A1", "B1"])
    assert board.valid_adjacencies?(submarine, ["A1", "A2"])
    assert board.valid_adjacencies?(cruiser, ["A1", "A2", "A3"])
    refute board.valid_adjacencies?(cruiser, ["A1", "C1", "C1"])
    refute board.valid_adjacencies?(submarine, ["A1", "B4"])
    refute board.valid_adjacencies?(submarine, ["A1", "B2"])
    refute board.valid_adjacencies?(cruiser, ["A1", "D2", "A3"])
  end

  def test_for_overlap
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "B1", "C1"])

    assert board.overlap?(submarine, ["A1", "B1"])
  end


  def test_total_valid_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "B1", "C1"])

    assert board.valid_placement?(submarine, ["A2", "B2"]) #general test
    assert board.valid_placement?(submarine, ["A3", "A2"]) #reverse test
    refute board.valid_placement?(cruiser, ["D4", "B3", "A2"]) #ship everywhere test
    refute board.valid_placement?(cruiser, ["B2", "C3", "D4"]) #diagonal test
    refute board.valid_placement?(submarine, ["B2", "C3"]) #diagonal test
    refute board.valid_placement?(cruiser, ["A1", "A2"]) #length test
    refute board.valid_placement?(cruiser, ["C1", "C2", "C3"]) #overlap test
    refute board.valid_placement?(cruiser, ["A1", "A2", "A3"]) #overlap test
  end

  def test_render
    # skip
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "B1", "C1"])
    expected = "  1  2  3  4  \nA .  .  .  .  \nB .  .  .  .  \nC .  .  .  .  \nD .  .  .  .  \n"
    # binding.pry
    assert_equal expected, board.render
  end


end
