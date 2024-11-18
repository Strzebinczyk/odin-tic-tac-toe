require_relative '../grid_renderer'
require_relative '../grid'
require 'test/unit'

class GridRendererTest < Test::Unit::TestCase
  def test_render_of_empty_grid
    grid = Grid.new
    rendered = GridRenderer.render(grid)
    expected = <<~EOF
         A | B | C#{' '}
      1    |   |#{'   '}
      -------------
      2    |   |#{'   '}
      -------------
      3    |   |#{'   '}
    EOF

    assert_equal(expected, rendered)
  end

  def test_render_of_grid_with_values
    grid = Grid.new
    grid.write(1, 'B', 'X')
    grid.write(3, 'C', 'X')
    grid.write(1, 'C', 'O')
    rendered = GridRenderer.render(grid)
    expected = <<~EOF
         A | B | C#{' '}
      1    | X | O#{' '}
      -------------
      2    |   |#{'   '}
      -------------
      3    |   | X#{' '}
    EOF
    assert_equal(expected, rendered)
  end
end
