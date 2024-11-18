require_relative '../grid_renderer'
require_relative '../grid'
require_relative '../game'
require 'test/unit'

class GameTest < Test::Unit::TestCase
  def test_initialize
    game = Game.new
    grid = Grid.new
    active_player = game.active_player
    expected = 'X'
    assert_equal(expected, active_player)
  end

  def test_change_player
    game = Game.new
    grid = Grid.new
    active_player = game.change_player
    expected = 'O'
    assert_equal(expected, active_player)
  end

  def test_put_sign
    game = Game.new
    grid = Grid.new
    coordinates = 'A3'
    expected = Grid.new.write(3, 'A', 'X')
    assert_equal(expected, game.put_sign(coordinates, grid))
  end

  def test_empty?
    game = Game.new
    grid = Grid.new
    coordinates = 'B2'
    expected = true
    assert_equal(expected, game.empty?(coordinates, grid))
  end

  def test_valid?
    game = Game.new
    coordinates = 'B2'
    expected = true
    assert_equal(expected, game.valid?(coordinates))
    coordinates = 'B22'
    expected = false
    assert_equal(expected, game.valid?(coordinates))
  end
end
