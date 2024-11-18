class GridRenderer
  def self.render(grid)
    <<~EOF
         A | B | C#{' '}
      1  #{grid.get(1, 'A') || ' '} | #{grid.get(1, 'B') || ' '} | #{grid.get(1, 'C') || ' '}#{' '}
      -------------
      2  #{grid.get(2, 'A') || ' '} | #{grid.get(2, 'B') || ' '} | #{grid.get(2, 'C') || ' '}#{' '}
      -------------
      3  #{grid.get(3, 'A') || ' '} | #{grid.get(3, 'B') || ' '} | #{grid.get(3, 'C') || ' '}#{' '}
    EOF
  end
end
