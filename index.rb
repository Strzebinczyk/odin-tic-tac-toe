require 'game'

game = Game.new

loop do
  player_input = game.get_player_input
  game.update(player_input)
  game.render
end
