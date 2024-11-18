class Grid
  attr_accessor :values

  def initialize
    @values = { 1 => { 'A' => nil, 'B' => nil, 'C' => nil },
                2 => { 'A' => nil, 'B' => nil, 'C' => nil },
                3 => { 'A' => nil, 'B' => nil, 'C' => nil } }
  end

  def get(row, column)
    return unless valid?(row, column)

    @values[row][column]
  end

  def write(row, column, value)
    return unless valid?(row, column, value)

    @values[row][column] = value
  end

  def valid?(row, column, value = 'X')
    [1, 2, 3].include?(row) && %w[A B C].include?(column) && %w[X O].include?(value)
  end
end
