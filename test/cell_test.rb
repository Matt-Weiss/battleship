require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require 'pry'

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

  def test_can_add_a_ship
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    refute cell.empty?
    assert_instance_of Ship, cell.ship
  end

  def test_cell_is_created_not_fired_upon
    cell = Cell.new("B4")
    refute cell.fired_upon?
  end

  def test_cell_is_fired_upon
    cell = Cell.new("B4")
    # binding.pry
    cell.fire_upon
    assert cell.fired_upon?
  end

  def test_ship_gets_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    assert_equal 2, cell.ship.health
  end

  def test_default_render
    cell_1 = Cell.new("B4")
    assert_equal ".", cell_1.render
  end

  def test_miss_render
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
    assert_equal "M", cell_1.render
  end

  def test_renders_with_ship_in_cell
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    assert_equal ".", cell_2.render

    cell_2.fire_upon
    assert_equal "H", cell_2.render
  end

  def test_renders_ship_for_player
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    assert_equal "S", cell_2.render(true)
  end
end
