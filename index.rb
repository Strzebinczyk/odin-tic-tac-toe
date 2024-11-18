require_relative 'grid_renderer'
require_relative 'grid'
require_relative 'game'

game = Game.new
grid = Grid.new
game.play_game(grid)
