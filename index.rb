require_relative 'game'

game = Game.new

loop do
  game.render
  coordinates = game.take_input
  game.update(coordinates)
  if game.win?
    puts "Congratulations Player #{game.active_player}, you won!"
    break
  end
  game.change_player
end
