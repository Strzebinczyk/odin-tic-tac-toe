class Game
  attr_accessor :active_player

  @active_player
  def initialize
    @active_player = 'X'
  end

  def change_player
    @active_player = if @active_player == 'X'
                       'O'
                     else
                       'X'
                     end
  end

  def put_sign(coordinates, grid)
    coordinates = coordinates.split('')
    column = coordinates[0]
    row = coordinates[1].to_i
    grid.write(row, column, @active_player)
  end

  def play_round(grid)
    puts "Player #{@active_player} please choose your spot"
    coordinates = gets.chomp.upcase
    until valid?(coordinates) && empty?(coordinates, grid)
      puts 'Please choose a valid spot'
      coordinates = gets.chomp.upcase
    end
    put_sign(coordinates, grid)
    puts GridRenderer.render(grid)
  end

  def empty?(coordinates, grid)
    coordinates = coordinates.split('')
    column = coordinates[0]
    row = coordinates[1].to_i
    grid.get(row, column).nil?
  end

  def valid?(coordinates)
    %w[A1 A2 A3 B1 B2 B3 C1 C2 C3].include?(coordinates)
  end

  def win?(grid)
    return true if grid.get(1,
                            'A') == grid.get(1, 'B') && grid.get(1, 'A') == grid.get(1, 'C') && !grid.get(1, 'A').nil?
    return true if grid.get(2,
                            'A') == grid.get(2, 'B') && grid.get(2, 'A') == grid.get(2, 'C') && !grid.get(2, 'A').nil?
    return true if grid.get(3,
                            'A') == grid.get(3, 'B') && grid.get(3, 'A') == grid.get(3, 'C') && !grid.get(3, 'A').nil?
    return true if grid.get(1,
                            'A') == grid.get(2, 'A') && grid.get(1, 'A') == grid.get(3, 'A') && !grid.get(1, 'A').nil?
    return true if grid.get(1,
                            'B') == grid.get(2, 'B') && grid.get(1, 'B') == grid.get(3, 'B') && !grid.get(1, 'B').nil?
    return true if grid.get(1,
                            'C') == grid.get(2, 'C') && grid.get(1, 'C') == grid.get(3, 'C') && !grid.get(1, 'C').nil?
    return true if grid.get(1,
                            'A') == grid.get(2, 'B') && grid.get(1, 'A') == grid.get(3, 'C') && !grid.get(1, 'A').nil?
    return true if grid.get(1,
                            'C') == grid.get(2, 'B') && grid.get(1, 'C') == grid.get(3, 'A') && !grid.get(1, 'C').nil?

    false
  end
end
