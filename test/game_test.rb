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

end
