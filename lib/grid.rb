require_relative 'cell'
require 'matrix'

class Grid
  attr_accessor :grid
  def initialize
    @grid = Matrix.build(10, 10) { |row, col| Cell.new(row, col) }.to_a
    # print initial grid
    print_grid
  end

  def print_grid
    @grid.each do |x|
      x.each do |y|
        print y.state
        print '  '
      end
      puts ''
    end
  end
end
