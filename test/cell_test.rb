require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

class CellTest < Minitest::Test

  def test_it_exists
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_no_ship_in_cell
    cell = Cell.new("B4")
    assert_nil cell.ship
  end

  def test_cell_empty
    cell = Cell.new("B4")
    assert cell.empty?
  end
end
