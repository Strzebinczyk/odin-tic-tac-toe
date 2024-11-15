class Grid
  attr_accessor :rows
  attr_reader :columns, :line

  def initialize
    @columns = '  A    B   C '
    @line = '------------'
    @rows = { 1 => { 'edge' => '1 ', 'A' => nil, 'middleA' => ' | ', 'B' => nil, 'middleB' => ' | ', 'C' => nil },
              2 => { 'edge' => '2 ', 'A' => nil, 'middleA' => ' | ', 'B' => nil, 'middleB' => ' | ', 'C' => nil },
              3 => { 'edge' => '3 ', 'A' => nil, 'middleA' => ' | ', 'B' => nil, 'middleB' => ' | ', 'C' => nil } }
  end

  def display_grid
    puts @columns
    puts @rows[1].values.join
    puts @line
    puts @rows[2].values.join
    puts @line
    puts @rows[3].values.join
  end

  def put_sign(coordinates, player)
    coordinates = coordinates.split('')
    column = coordinates[0]
    row = coordinates[1].to_i
    if player == 'O'
      @rows[row][column] = 'O'
    elsif player == 'X'
      @rows[row][column] = 'X'
    end
  end

  def play_round(player)
    puts "Player #{player} please choose your spot"
    coordinates = gets.chomp.upcase
    until valid?(coordinates) && empty?(coordinates)
      puts 'Please choose a valid spot'
      coordinates = gets.chomp.upcase
    end
    put_sign(coordinates, player)
  end

  def empty?(coordinates)
    coordinates = coordinates.split('')
    column = coordinates[0]
    row = coordinates[1].to_i
    rows[row][column].nil?
  end

  def valid?(coordinates)
    %w[A1 A2 A3 B1 B2 B3 C1 C2 C3].include?(coordinates)
  end

  def win?
    return true if rows[1]['A'] == rows[1]['B'] && rows[1]['A'] == rows[1]['C'] && !rows[1]['A'].nil?
    return true if rows[2]['A'] == rows[2]['B'] && rows[2]['A'] == rows[2]['C'] && !rows[2]['A'].nil?
    return true if rows[3]['A'] == rows[3]['B'] && rows[3]['A'] == rows[3]['C'] && !rows[3]['A'].nil?
    return true if rows[1]['A'] == rows[2]['A'] && rows[1]['A'] == rows[3]['A'] && !rows[1]['A'].nil?
    return true if rows[1]['B'] == rows[2]['B'] && rows[1]['B'] == rows[3]['B'] && !rows[1]['B'].nil?
    return true if rows[1]['C'] == rows[2]['C'] && rows[1]['C'] == rows[3]['C'] && !rows[1]['C'].nil?
    return true if rows[1]['A'] == rows[2]['B'] && rows[1]['A'] == rows[3]['C'] && !rows[1]['A'].nil?
    return true if rows[1]['C'] == rows[2]['B'] && rows[1]['C'] == rows[3]['A'] && !rows[1]['C'].nil?

    false
  end
end

def play_game
  grid = Grid.new
  grid.display_grid
  loop do
    grid.play_round('O')
    grid.display_grid
    if grid.win?
      puts 'Congratulations Player O, you won!'
      break
    else
      grid.play_round('X')
      grid.display_grid
      if grid.win?
        puts 'Congratulations Player X, you won!'
        break
      end
    end
  end
end


play_game
