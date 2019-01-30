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

end
