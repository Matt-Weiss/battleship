require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'

class ShipTest < Minitest::Test

  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_ship_attributes
    cruiser = Ship.new("Cruiser", 3)
    assert_equal "Cruiser", cruiser.name
    assert_equal 3, cruiser.length
  end

  def test_ship_has_full_health
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.health
  end

  def test_ship_gets_damaged
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    assert_equal 2, cruiser.health
  end

  def test_ship_still_floating
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cruiser.sunk?
  end

  def test_ship_can_be_sunk
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    cruiser.hit
    cruiser.hit
    assert_equal true, cruiser.sunk?
  end
end
