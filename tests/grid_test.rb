require_relative '../grid'
require 'test/unit'

class GridTest < Test::Unit::TestCase
  def test_initialize
    assert_equal({ 1 => { 'A' => nil, 'B' => nil, 'C' => nil },
                   2 => { 'A' => nil, 'B' => nil, 'C' => nil },
                   3 => { 'A' => nil, 'B' => nil, 'C' => nil } }, Grid.new.values)
  end

  def test_valid?
    assert_equal(true, Grid.new.valid?(3, 'B'))
    assert_equal(false, Grid.new.valid?(3, ' '))
    assert_equal(false, Grid.new.valid?(6, 'B'))
  end

  def test_read
    assert_equal(nil, Grid.new.get(3, 'A'))
  end

  def test_write
    grid = Grid.new
    grid.write(3, 'B', 'X')
    assert_equal('X', grid.get(3, 'B'))
  end
end
