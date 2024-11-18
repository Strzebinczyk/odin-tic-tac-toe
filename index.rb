require_relative 'grid_renderer'
require_relative 'grid'
require_relative 'game'

game = Game.new
grid = Grid.new

puts GridRenderer.render(grid)
loop do
  game.play_round(grid)
  if game.win?(grid)
    puts "Congratulations Player #{game.active_player}, you won!"
    break
  end
  game.change_player
end
