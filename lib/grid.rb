require_relative 'cell'
require 'matrix'

class Grid
  attr_accessor :grid
  def initialize
    @grid = []
    10.times do |y|
      temp = Array.new
      10.times do |x|
        temp << Cell.new(y, x)
      end
      @grid << temp
    end
    print_grid(@grid)
  end

  def print_grid(grid)
    grid.each do |y|
      y.each do |x|
        print x.state
        print " "
      end
      puts ""
    end
  end

  def find_neighbours(cell)
    neighbours = Array.new
    neighbours << grid[cell.y-1][cell.x-1] if (cell.y > 0 && cell.x > 0)
    neighbours << grid[cell.y-1][cell.x] if cell.y > 0
    neighbours << grid[cell.y-1][cell.x+1] if (cell.y > 0 && cell.x < 9)

    neighbours << grid[cell.y][cell.x-1] if cell.x > 0
    neighbours << grid[cell.y][cell.x+1] if cell.x < 9

    neighbours << grid[cell.y+1][cell.x-1] if (cell.y < 9 && cell.x > 0)
    neighbours << grid[cell.y+1][cell.x] if cell.y < 9
    neighbours << grid[cell.y+1][cell.x+1] if (cell.y < 9 && cell.x < 9)
    neighbours.compact
  end

  def neighbouring_alive_count(c)
    count = 0
    find_neighbours(c).each do |n|
      count += 1 if n.alive?
    end
    count
  end
end
