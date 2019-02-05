require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer'
require './lib/messaging'

class ComputerTest < Minitest::Test

  def test_it_exists
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_can_fire_on_cell
    computer = Computer.new
    player_board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    computer.fire(player_board)

    cells_fired_on = player_board.cells.select do |key, value|
      player_board.cells[key].fired_upon?
    end

    assert_equal 1, cells_fired_on.length
  end

  def test_it_wont_fire_on_same_cell_twice
    computer = Computer.new
    player_board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    16.times do
    computer.fire(player_board)
    end

    cells_fired_on = player_board.cells.select do |key, value|
      player_board.cells[key].fired_upon?
    end

    assert_equal 16, cells_fired_on.length
  end

  def test_it_can_place_valid_ships
    computer = Computer.new
    computer_board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    cells_with_ship = computer_board.cells.select do |key, value|
      computer_board.cells[key].empty? == false
    end

    assert_equal 0, cells_with_ship.length

    computer.place_ship(cruiser, computer_board)

    cells_with_ship = computer_board.cells.select do |key, value|
      computer_board.cells[key].empty? == false
    end

    assert_equal 3, cells_with_ship.length
  end

  def test_it_can_place_large_ships_on_large_board
    computer = Computer.new
    computer_board = Board.new(10,10)
    carrier = Ship.new("Carrier", 5)

    cells_with_ship = computer_board.cells.select do |key, value|
      computer_board.cells[key].empty? == false
    end

    assert_equal 0, cells_with_ship.length

    computer.place_ship(carrier, computer_board)

    cells_with_ship = computer_board.cells.select do |key, value|
      computer_board.cells[key].empty? == false
    end

    assert_equal 5, cells_with_ship.length
  end

end
