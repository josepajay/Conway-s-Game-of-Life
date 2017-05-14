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
    print_grid
  end

  def print_grid
    grid.each do |y|
      y.each do |x|
        print x.state
        print " "
      end
      puts ""
    end
  end

  def next_generation
    #Refactor!!
    next_grid = Array.new
    @grid.each do |y|
      temp = Array.new
      y.each do |x|
        case(neighbouring_alive_count(x))
        when 0, 1
          temp << Cell.new(x.y, x.x, 0)
        when 3
          temp << Cell.new(x.y, x.x, 1)
        when 2
          temp << Cell.new(x.y, x.x, 1) if x.alive?
          temp << Cell.new(x.y, x.x, 0) if x.dead?
        when 2, 3
          temp << Cell.new(x.y, x.x, 1) if x.alive?
        end
        if neighbouring_alive_count(x) > 3
          temp << Cell.new(x.y, x.x, 0)
        end
      end
      next_grid << temp
    end
    @grid = next_grid
    print_grid
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
